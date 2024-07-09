import 'dart:async';
import 'dart:developer';
import 'dart:math';
import 'dart:typed_data';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/core/utils/bytes_from_firebase_storage.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/core/utils/replace_phone_with_name.dart';
import 'package:sicherr/domain/entities/tracking/tracking.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/bloc/map/map_focus_request/map_focus_request_cubit.dart';
import 'package:sicherr/presentation/bloc/map/search_position/search_position_cubit.dart';
import 'package:sicherr/presentation/bloc/navbar_selected_page_index/navbar_selected_page_index_cubit.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/bloc/send_sos/send_sos_bloc.dart';
import 'package:sicherr/presentation/bloc/tracking/tracking_cubit.dart';
import 'package:sicherr/presentation/screens/configure_contacts/widgets/dropdown_radius_button.dart';
import 'package:sicherr/presentation/screens/map/widgets/choose_eta_contacts.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';

import '../../../../../core/const/colors.dart';
import '../../../../core/const/images.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../bloc/map/home_position/home_position_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;

class MapBody extends StatefulWidget {
  const MapBody({super.key});

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> with AutomaticKeepAliveClientMixin {
  final Completer<GoogleMapController> mapController = Completer();
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor homeMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor userMarker = BitmapDescriptor.defaultMarker;

  String address = '';
  Set<Marker> markers = {};
  Set<Marker> trackingMarkers = {};
  Map<String,BitmapDescriptor> customPhotoMarkers = {};
  Position? _currentPosition;
  Set<Polyline> trackingPolylines = {};
  Set<Polyline> polylines = {};

  late final StreamSubscription<Position> _positionSubscription;

  double distance = 0;
  late PageController _pageViewController;
  LatLng? pickedPosition;

  @override
  void initState() {
    _pageViewController = PageController();
    addCustomIcon();
    _listenLocationChanges();
    context.read<TrackingCubit>().startListeningTrackings(
        userUid: context.read<AuthBloc>().state.user!.uid);
    super.initState();
  }

  void _listenLocationChanges() {
    _positionSubscription = Geolocator.getPositionStream().listen((event) {
      if (context.read<SendSosBloc>().state.isStreamingSOS) {
        final profileInfo = context.read<ProfileBloc>().state.profileInfo!;
        final userId = profileInfo.id;
        final userName = profileInfo.phone;
        final photoURL = profileInfo.photoURL;
        final tracking = Tracking(
          photoURL: photoURL,
            userId: userId,
            userName: PhoneNumberEncryptor().decrypt(userName),
            lat: event.latitude,
            long: event.longitude,
            isSosSignal: true);
        context
            .read<SendSosBloc>()
            .add(SendSosEvent.pushTracking(tracking: tracking));
      } else if (context.read<HomePositionCubit>().state.navigationStarted) {
        final profileInfo = context.read<ProfileBloc>().state.profileInfo!;
        final userId = profileInfo.id;
        final userName = profileInfo.phone;
        final photoURL = profileInfo.photoURL;
        context.read<HomePositionCubit>().navigate(
            photoURL: photoURL!,
            userPosition: _currentPosition!,
            userId: userId,
            userName: PhoneNumberEncryptor().decrypt(userName));
      }
      final requestedMapFocusLocation =
          context.read<MapFocusRequestCubit>().state;
      if (requestedMapFocusLocation != null && _currentPosition == null) {
        _changeCameraPosition(requestedMapFocusLocation);
      } else if (_currentPosition == null) {
        _changeCameraPosition(LatLng(event.latitude, event.longitude));
      }
      _currentPosition = event;
      setState(() {});
    });
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
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      AppImages.userMarker,
    ).then(
      (icon) {
        setState(() {
          userMarker = icon;
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
            onTap: () {
              showBottomCard(context);
            }),
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

  void updateMarkers(List<Tracking> tracking){
    trackingMarkers = tracking
        .map((e){
      final userId = e.userId;
      final userPhotoURL = e.photoURL;
      final customPhotoMarker = customPhotoMarkers[userId];
      final icon = customPhotoMarker ?? userMarker;
      if(userPhotoURL != null && customPhotoMarker == null){
        getBytesFromFirestoreStorage(userPhotoURL).then((value){
          if(value != null){
            _createMarkerImageFromBytes(value).then((value){
              customPhotoMarkers[userId] = value;
              updateMarkers(tracking);
            });
          }
        });
      }
      return Marker(
          icon: icon,
          infoWindow: InfoWindow(title: replacePhoneWithName(context: context, input: e.userName)),
          markerId: MarkerId(e.userId),
          position: LatLng(e.lat, e.long));
    })
        .toSet();
  }

  Future<BitmapDescriptor> _createMarkerImageFromBytes(List<int> imageBytes) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(Uint8List.fromList(imageBytes), (ui.Image img) {
      return completer.complete(img);
    });
    final ui.Image image = await completer.future;
    final img.Image baseSizeImage = img.copyResize(img.decodeImage(Uint8List.fromList(imageBytes))!, width: 176, height: 176);

    final img.Image circleImage = img.Image(width: 176, height: 176);
    img.fill(circleImage, color: img.ColorRgba8(0, 0, 0, 0));

    final int centerX = baseSizeImage.width ~/ 2;
    final int centerY = baseSizeImage.height ~/ 2;
    final int radius = 72;

    for (int y = 0; y < circleImage.height; y++) {
      for (int x = 0; x < circleImage.width; x++) {
        final double dx = (x - centerX).toDouble();
        final double dy = (y - centerY).toDouble();
        if (sqrt(dx * dx + dy * dy) <= radius) {
          circleImage.setPixel(x, y, baseSizeImage.getPixel(x, y));
        }
      }
    }

    final Uint8List imageData = Uint8List.fromList(img.encodePng(circleImage));
    return BitmapDescriptor.fromBytes(imageData);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (context.read<HomePositionCubit>().state.position != null) {
      _addHomeMarker(context.read<HomePositionCubit>().state.position!);
    }
    return BlocListener<MapFocusRequestCubit, LatLng?>(
      listener: (context, state) {
        if (state == null) return;
        _changeCameraPosition(state);
      },
      child: BlocListener<TrackingCubit, TrackingState>(
        listener: (context, state) {
          state.maybeMap(
              loaded: (state) {
                updateMarkers(state.tracking);
                trackingPolylines = state.tracking
                    .map((e) => Polyline(
                        color: Colors.blue,
                        polylineId: PolylineId(e.userId),
                        points: e.polygones
                            .map((e) => LatLng(e.lat, e.long))
                            .toList()))
                    .toSet();
                setState(() {});
              },
              orElse: () {});
        },
        child: BlocListener<HomePositionCubit, HomePositionState>(
          listener: (context, state) {
            state.maybeMap(
                successfullyFinished: (_) {
                  setState(() {
                    polylines.clear();
                    markers.removeWhere(
                        (element) => element.position != state.position);
                  });
                },
                navigationFailed: (_) {
                  setState(() {
                    polylines.clear();
                    markers.removeWhere(
                        (element) => element.position != state.position);
                  });
                },
                orElse: () {});
          },
          child: BlocListener<SearchPositionCubit, SearchPositionState>(
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
              initialCameraPosition: const CameraPosition(
                target: LatLng(
                  0,
                  0,
                ),
                zoom: 12,
              ),
              markers: {...markers, ...trackingMarkers},
              polylines: {...polylines, ...trackingPolylines},
              onMapCreated: (GoogleMapController controller) async {
                if (!mapController.isCompleted) {
                  mapController.complete(controller);
                }
              },
              onTap: (LatLng position) async {
                if (context.read<HomePositionCubit>().state.navigationStarted)
                  return;

                await _getAddressFromLatLng(position);
                _addPositionMarker(position);
                _changeCameraPosition(position);
                if (mounted) {
                  showBottomCard(context);
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  showBottomCard(BuildContext context) {
    if (context.read<HomePositionCubit>().state.navigationStarted) {
      _pageViewController = PageController(initialPage: 2);
    } else {
      _pageViewController = PageController(initialPage: 0);
    }
    return showModalBottomSheet(
      backgroundColor: AppColors.white,
      barrierColor: Colors.transparent,
      isScrollControlled: true,
      showDragHandle: true,
      enableDrag: true,
      context: context,
      builder: (BuildContext bc) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: BlocConsumer<HomePositionCubit, HomePositionState>(
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
                                  text:
                                      AppLocalizations.of(context)!.directions,
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
                                        text: AppLocalizations.of(context)!
                                            .delete,
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
                                                    .addHome,
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
                                        text: AppLocalizations.of(context)!
                                            .delete,
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
                                    final profileInfo = context
                                        .read<ProfileBloc>()
                                        .state
                                        .profileInfo!;
                                    final userId = profileInfo.id;
                                    final userName = profileInfo.phone;
                                    final photoURL = profileInfo.photoURL;
                                    context.read<HomePositionCubit>().navigate(
                                        photoURL: photoURL,
                                        userPosition: _currentPosition!,
                                        userId: userId,
                                        userName: PhoneNumberEncryptor()
                                            .decrypt(userName));
                                    _pageViewController.jumpToPage(2);
                                    final phoneNumber = context
                                        .read<ProfileBloc>()
                                        .state
                                        .profileInfo!
                                        .phone;
                                    context
                                        .read<HomePositionCubit>()
                                        .notifyEtaContacts(
                                            data: {
                                              "type": "tracking",
                                              "link": "https://www.google.com/maps?q=${_currentPosition!.latitude},${_currentPosition!.longitude}&z=15"
                                            },
                                            title: PhoneNumberEncryptor()
                                                .decrypt(phoneNumber),
                                            message:
                                                AppLocalizations.of(context)!
                                                    .contact_shared_route);
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
                                context.read<HomePositionCubit>().reset();
                                setState(() {
                                  polylines.clear();
                                  markers.removeWhere((element) =>
                                      element.position != state.position);
                                });
                                Navigator.of(context).pop();
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
          ),
        );
      },
    ).whenComplete(() {
      if (context.read<HomePositionCubit>().state.navigationStarted) {
        return;
      }

      if (context.read<HomePositionCubit>().state.position != null) {
        markers.removeWhere((e) =>
            e.position != context.read<HomePositionCubit>().state.position);
      } else {
        markers.clear();
      }

      setState(() {
        polylines.clear();
        distance = 0;
      });
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

  @override
  void dispose() {
    _positionSubscription.cancel();
    super.dispose();
  }
}
