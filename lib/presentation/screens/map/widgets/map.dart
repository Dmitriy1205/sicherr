import 'dart:async';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/core/utils/dialogs.dart';
import 'package:sicherr/presentation/bloc/map/search_position/search_position_cubit.dart';
import 'package:sicherr/presentation/screens/configure_contacts/widgets/dropdown_radius_button.dart';
import 'package:sicherr/presentation/screens/map/widgets/choose_eta_contacts.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';

import '../../../../../core/const/colors.dart';
import '../../../../core/const/images.dart';
import '../../../bloc/map/home_position/home_position_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> mapController = Completer();
  GoogleMapController? _controller;
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor homeMarkerIcon = BitmapDescriptor.defaultMarker;
  String address = '';
  Set<Marker> markers = {};
  Position? _currentPosition;
  Set<Polyline> polylines = {};

  double distance = 0;
  late PageController _pageViewController;
  LatLng? pickedPosition;

  @override
  void initState() {
    _pageViewController = PageController();
    addCustomIcon();
    _getCurrentLocation();
    super.initState();
  }

  Future<void> _getCurrentLocation() async {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {});
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      AppImages.locationMarker,
    ).then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      AppImages.homeMarker,
    ).then(
      (icon) {
        setState(() {
          homeMarkerIcon = icon;
        });
      },
    );
  }

  Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      Placemark place = placemarks[0];
      setState(() {
        pickedPosition = position;
        address = place.street!.isEmpty || place.name == place.street
            ? '${place.name}'
            : '${place.subLocality}, ${place.name}';
      });
    } catch (e) {
      print(e);
    }
  }

  void _addPositionMarker(LatLng position) {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          icon: markerIcon,
        ),
      );
    });
  }

  void _addHomeMarker(LatLng position) {
    setState(() {
      markers.add(
        Marker(
            markerId: MarkerId(position.toString()),
            position: position,
            icon: homeMarkerIcon,
            onTap: () async {
              await _getAddressFromLatLng(position);
              if (mounted) {
                showBottomCard(context);
              }
            }),
      );
    });
  }

  Future<void> _changeCameraPosition(LatLng position) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: position,
      zoom: 13,
    )));
  }

  void _startLocationUpdates() {
    Geolocator.getPositionStream().listen((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _checkDeviation();
    });
  }
  //TODO: needs implement in navigation repo and remove from here
  Future<void> _checkDeviation() async {
    if (_currentPosition == null) return;

    double minDistance = double.infinity;

    for (var point
        in context.read<HomePositionCubit>().state.routeDetails.route) {
      double distance = Geolocator.distanceBetween(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
        point.latitude,
        point.longitude,
      );
      if (distance < minDistance) {
        minDistance = distance;
      }
    }

    if (minDistance >
        context.read<HomePositionCubit>().state.routeDetails.radius) {
      AppDialogs.showDeviationDialog(context);
    } else if (minDistance <= 0.10) {
      AppDialogs.showArrivedDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (context.read<HomePositionCubit>().state.position != null) {
      _addHomeMarker(context.read<HomePositionCubit>().state.position!);
    }
    return BlocListener<SearchPositionCubit, SearchPositionState>(
      listener: (context, state) {
        state.maybeMap(
          positionPicked: (s) async {
            await _getAddressFromLatLng(s.placeDetails.latlng);
            _addPositionMarker(s.placeDetails.latlng);
            _changeCameraPosition(s.placeDetails.latlng);
            if (mounted) {
              showBottomCard(context);
            }
          },
          orElse: () {},
        );
      },
      child: GoogleMap(
        mapToolbarEnabled: false,
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
          zoom: 12,
        ),
        markers: markers,
        polylines: polylines,
        onMapCreated: (GoogleMapController controller) async {
          _controller = controller;

          if (!mapController.isCompleted) {
            mapController.complete(controller);
          }
        },
        onTap: (LatLng position) async {
          await _getAddressFromLatLng(position);
          _addPositionMarker(position);
          _changeCameraPosition(position);
          if (mounted) {
            showBottomCard(context);
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  //TODO : need to change each view  for suitable state
  showBottomCard(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (BuildContext bc) {
        return BlocConsumer<HomePositionCubit, HomePositionState>(
          listener: (context, state) {
            state.maybeMap(
                routPicked: (s) {
                  setState(() {
                    polylines.add(Polyline(
                      polylineId: const PolylineId('route'),
                      points: s.routeDetails.route,
                      color: Colors.blue,
                      width: 4,
                    ));
                  });
                },
                loaded: (_) {
                  markers.removeWhere(
                      (element) => element.position != state.position);
                },
                orElse: () {});
          },
          builder: (context, state) {
            return state.maybeMap(orElse: () {
              return Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: ExpandablePageView(
                  controller: _pageViewController,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            children: [
                              AppElevatedButton(
                                text: AppLocalizations.of(context)!.directions,
                                onPressed: () {
                                  // await _getPolyline(position: pickedPosition!);
                                  context.read<HomePositionCubit>().setRoute(
                                      userPosition: LatLng(
                                          _currentPosition!.latitude,
                                          _currentPosition!.longitude),
                                      markerPosition: pickedPosition!);
                                  _pageViewController.jumpToPage(1);
                                },
                                width: 0,
                                widget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.directions,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)!
                                            .directions,
                                        style: AppTheme
                                            .themeData.textTheme.labelSmall!
                                            .copyWith(fontSize: 16)),
                                  ],
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.white),
                                borderRadius: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              state.position == null ||
                                      state.position != pickedPosition
                                  ? AppElevatedButton(
                                      text:
                                          AppLocalizations.of(context)!.delete,
                                      onPressed: () {
                                        _addHomeMarker(pickedPosition!);
                                        context
                                            .read<HomePositionCubit>()
                                            .setPosition(
                                                position: pickedPosition!);
                                      },
                                      width: 0,
                                      color: AppColors.blue,
                                      widget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.add,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .delete,
                                              style: AppTheme.themeData
                                                  .textTheme.labelSmall!
                                                  .copyWith(fontSize: 16)),
                                        ],
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.white),
                                      borderRadius: 30,
                                    )
                                  : AppElevatedButton(
                                      text:
                                          AppLocalizations.of(context)!.delete,
                                      onPressed: () {
                                        context
                                            .read<HomePositionCubit>()
                                            .removePosition();
                                        setState(() {
                                          markers.clear();
                                        });
                                      },
                                      width: 0,
                                      color: Colors.red,
                                      widget: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                              AppLocalizations.of(context)!
                                                  .delete,
                                              style: AppTheme.themeData
                                                  .textTheme.labelSmall!
                                                  .copyWith(fontSize: 16)),
                                        ],
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .copyWith(color: AppColors.white),
                                      borderRadius: 30,
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          '(${(state.routeDetails.distance / 1000).toStringAsFixed(2)} km)',
                          style: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(fontSize: 20, color: AppColors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Row(
                            children: [
                              AppElevatedButton(
                                text: AppLocalizations.of(context)!.start,
                                onPressed: () {
                                  _checkDeviation();
                                  _startLocationUpdates();
                                  _pageViewController.jumpToPage(2);
                                },
                                width: 0,
                                color: AppColors.green,
                                widget: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SvgPicture.asset(
                                      AppIcons.start,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(AppLocalizations.of(context)!.start,
                                        style: AppTheme
                                            .themeData.textTheme.labelSmall!
                                            .copyWith(fontSize: 16))
                                  ],
                                ),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.white),
                                borderRadius: 30,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              DropdownRadiusButton(
                                routeDetails: state.routeDetails,
                              ),
                            ],
                          ),
                        ),
                        AppElevatedButton(
                          text: AppLocalizations.of(context)!.shareETA,
                          onPressed: () {
                            showShareEtaCard(context);
                          },
                          width: 0,
                          color: AppColors.blue,
                          widget: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppIcons.eta,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(AppLocalizations.of(context)!.shareETA,
                                  style: AppTheme
                                      .themeData.textTheme.labelSmall!
                                      .copyWith(fontSize: 16))
                            ],
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.white),
                          borderRadius: 30,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          address,
                          style: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          '(${(state.routeDetails.distance / 1000).toStringAsFixed(2)} km)',
                          style: AppTheme.themeData.textTheme.titleSmall!
                              .copyWith(fontSize: 20, color: AppColors.grey),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: AppElevatedButton(
                            text: AppLocalizations.of(context)!.exit,
                            onPressed: () {
                              _pageViewController.jumpToPage(1);
                            },
                            width: 0,
                            color: Colors.red,
                            widget: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.directions,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(AppLocalizations.of(context)!.exit,
                                    style: AppTheme
                                        .themeData.textTheme.labelSmall!
                                        .copyWith(fontSize: 16))
                              ],
                            ),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.white),
                            borderRadius: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            });
          },
        );
      },
    ).whenComplete(() {
      if (context.read<HomePositionCubit>().state.position != null) {
        markers.removeWhere((element) =>
            element.position !=
            context.read<HomePositionCubit>().state.position);
        setState(() {
          polylines.clear();
          distance = 0;
        });
      } else {
        setState(() {
          markers.clear();
          polylines.clear();
          distance = 0;
        });
      }
    });
  }

  showShareEtaCard(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return BlocBuilder<HomePositionCubit, HomePositionState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(26, 26, 26, 18),
              child: ExpandablePageView(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.shareETA,
                            style: AppTheme.themeData.textTheme.titleSmall!
                                .copyWith(fontSize: 20),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 28,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      state.routeDetails.etaContacts.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColors.etaFieldGrey.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 21.0, vertical: 17),
                                child: Row(
                                  children: [
                                    const Icon(
                                        Icons.supervised_user_circle_rounded),
                                    const SizedBox(
                                      width: 13,
                                    ),
                                    Text(state
                                        .routeDetails.etaContacts.first.name),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(
                              height: 53,
                            ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const ChooseEtaContactScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                var offsetAnimation = animation.drive(tween);
                                return SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.etaFieldGrey.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 21.0, vertical: 17),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.eta,
                                  color: AppColors.blue,
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.openContacts,
                                  style: AppTheme
                                      .themeData.textTheme.titleSmall!
                                      .copyWith(
                                          fontSize: 16, color: AppColors.blue),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 51,
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
