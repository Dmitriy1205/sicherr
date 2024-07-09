import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/core/utils/replace_phone_with_name.dart';
import 'package:sicherr/domain/entities/tracking/tracking.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/bloc/map/map_focus_request/map_focus_request_cubit.dart';
import 'package:sicherr/presentation/bloc/navbar_selected_page_index/navbar_selected_page_index_cubit.dart';
import 'package:sicherr/presentation/bloc/tracking/tracking_cubit.dart';
import 'package:sicherr/presentation/bloc/user_notifications/user_notifications_cubit.dart';
import 'package:sicherr/presentation/screens/home/widgets/circle_action_button.dart';
import 'package:sicherr/presentation/screens/initial.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/utils/notifications_ontap_handler.dart';
import '../../../data/remote/fcm_service.dart';
import '../../../domain/entities/contact_entity/contact_entity.dart';
import '../../bloc/contacts/contacts_bloc.dart';
import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../bloc/shared_contacts/sc_bloc.dart';
import '../../widgets/app_toast.dart';
import '../../widgets/grouped_items/grouped_items.dart';
import '../../widgets/grouped_items/grouped_items_factory.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/search_phone_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _handleMessage(Map<String, dynamic> data) {
    NotificationsOnTapHandler({NotificationsOnTapEvents.sos: _handleSOS, NotificationsOnTapEvents.tracking: _handleSOS})
        .handleInitialMessage(data);
  }

  void _handleSOS(Map<String, dynamic> data) {
    final googleMapsLink = data['link'] as String;
    if (googleMapsLink.isEmpty) return;
    Future.delayed(const Duration(milliseconds: 10), () {
      context
          .read<NavbarSelectedPageIndexCubit>()
          .changeIndex(PrimaryPageEnum.map.index);
      final comaSeparatedLocationsList = googleMapsLink
          .replaceAll("https://www.google.com/maps?q=", "")
          .replaceAll("&z=15", "")
          .split(",");
      final lat = double.parse(comaSeparatedLocationsList.first);
      final long = double.parse(comaSeparatedLocationsList.last);
      context.read<MapFocusRequestCubit>().changeMapFocus(LatLng(lat, long));
    });
  }

  @override
  void initState() {
    FirebaseMessaging.instance.getInitialMessage().then((e) {
      if (e == null) return;
      _handleMessage(e.data);
    });
    sl<FCMService>().initializeLocalNotifications((n) {
      if (n.payload == null) return;
      final payloadMap =
          (jsonDecode(n.payload!) as Map).cast<String, dynamic>();
      _handleMessage(payloadMap);
    });
    context.read<UserNotificationsCubit>().listenToNotifications(
        userUid: context.read<AuthBloc>().state.user!.uid);
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    context.read<ScBloc>().add(const ScEvent.getAllSC());
    super.initState();
  }

  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ContactsBloc, ContactsState>(
        listener: (BuildContext context, ContactsState state) {
          state.maybeMap(
              notFoundContact: (_) {
                AppToast.showError(
                    context, AppLocalizations.of(context)!.noContacts);
              },
              openFoundedContact: (state) {
                _searchTextController.text = '';
                context
                    .read<ContactsBloc>()
                    .add(const ContactsEvent.searchContact(''));
              },
              orElse: () {});
        },
        builder: (context, state) {
          return state.maybeMap(
              loadInProgress: (_) => const Center(child: LoadingIndicator()),
              orElse: () => const Center(child: LoadingIndicator()),
              loaded: (state) => Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 18),
                        child: SearchPhoneField(
                          controller: _searchTextController,
                          hintText: AppLocalizations.of(context)!.search,
                          onSubmitted: (text) {
                            context.read<EmergencyContactBloc>().add(
                                const EmergencyContactEvent.getAllEmContacts());

                            context
                                .read<ContactsBloc>()
                                .add(ContactsEvent.searchContact(text));
                            if (_searchTextController.text.isNotEmpty) {
                              context.read<ContactsBloc>().add(
                                  ContactsEvent.searchSharedContact(
                                      _searchTextController.text));
                            }
                          },
                        ),
                      ),
                      // _searchTextController.text.isEmpty
                      //     ?
                      const Expanded(
                        child: HomeButtonsSlider(),
                      )
                      // : ContactListDisplayed(
                      //     groupedContacts: state.categorizedContacts,
                      //     searchingNumber: _searchTextController.text,
                      //   )
                    ],
                  ));
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}

class ContactListDisplayed extends StatelessWidget {
  const ContactListDisplayed({
    Key? key,
    required this.groupedContacts,
    required this.searchingNumber,
  }) : super(key: key);
  final Map<String, List<ContactEntity>> groupedContacts;
  final String searchingNumber;

  @override
  Widget build(BuildContext context) {
    return groupedContacts.isEmpty
        ? Expanded(
            child: GestureDetector(
              onTap: () {
                context
                    .read<ContactsBloc>()
                    .add(ContactsEvent.searchSharedContact(searchingNumber));
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.searchForContact,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      searchingNumber,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : GroupedItems(
            groupedContacts: groupedContacts,
            contactFactory: ContactCardFactory(),
          );
  }
}

class HomeButtonsSlider extends StatefulWidget {
  const HomeButtonsSlider({
    super.key,
  });

  @override
  State<HomeButtonsSlider> createState() => _HomeButtonsSliderState();
}

class _HomeButtonsSliderState extends State<HomeButtonsSlider> {
  int selectedIndex = 0;
  final controller = CarouselController();
  Position? position;

  @override
  void initState() {
    getCurrentPosition();
    super.initState();
  }

  getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse) {
      position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            _SOSWidget(
              position: position,
              isSelected: true,
              goToNextItem: _goToNextButton,
            ),
            const SizedBox(
              height: 25,
            ),
            _StartAlarm(
              isSelected: true,
              goToNextItem: _goToNextButton,
            ),
            const Spacer(),
            _Notifications(),
            const Spacer()
          ],
        ));
    /*
    In case customer changes his mind of design
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
            onPageChanged: (index, reason) =>
                setState(() => selectedIndex = index),
            initialPage: selectedIndex,
            aspectRatio: 1,
            height: 200,
            viewportFraction: 0.6,
            enableInfiniteScroll: false,
            scrollPhysics: const ClampingScrollPhysics(),
          ),
          items: [
            _SOSWidget(
              position: position,
              isSelected: selectedIndex == 0,
              goToNextItem: _goToNextButton,
            ),
            _StartAlarm(
              isSelected: selectedIndex == 1,
              goToNextItem: _goToNextButton,
            )
          ]),
    );*/
  }

  _goToNextButton(int page) {
    selectedIndex = page;
    controller.animateToPage(
      page,
      duration: const Duration(milliseconds: 100),
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications();

  void _showLocationOnMap(
      {required BuildContext context, String? userName}) {
    final tracking = context.read<TrackingCubit>().state.maybeMap(
        loaded: (state) => state.tracking,
        orElse: () => <Tracking>[]);
    final trackingUserData = tracking.where((e) => e.userName == userName).firstOrNull;
    if(trackingUserData == null) return;

    context
        .read<NavbarSelectedPageIndexCubit>()
        .changeIndex(PrimaryPageEnum.map.index);
    final lat = trackingUserData.lat;
    final long = trackingUserData.long;
    context.read<MapFocusRequestCubit>().changeMapFocus(LatLng(lat, long));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserNotificationsCubit, List<Map<String,dynamic>>>(
      builder: (context, state) {
        return SizedBox(
          height: 120,
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: state.length,
              options: CarouselOptions(
                  viewportFraction: 0.7,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  enlargeStrategy: CenterPageEnlargeStrategy.zoom),
              itemBuilder: (context, i, j) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: _element(
                        context: context,
                        notification: state[i],
                        onTap: () => _showLocationOnMap(
                            context: context, userName: state[i]["data"]["user_name"] ?? state[i]["title"])));
              }),
        );
      },
    );
  }

  Widget _element(
      {required BuildContext context,
        required Map<String,dynamic> notification,
      required VoidCallback onTap}) {
    final title = notification["title"];
    final message = notification["message"];
    final data = notification["data"];
    final isSos = data["type"] == "sos";
    final userName = data["user_name"];
    final text = isSos ? AppLocalizations.of(context)!.notification_started_sos(userName) : title + "\n" + message;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: AppColors.mainAccent.withOpacity(0.3),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
          child: SizedBox(
            width: double.infinity,
              height: 72,
              child: Text(
            replacePhoneWithName(context: context, input: text),
            style: const TextStyle(fontWeight: FontWeight.w500),
          )),
        ),
      ),
    );
  }
}

class _StartAlarm extends StatelessWidget {
  const _StartAlarm({required this.isSelected, required this.goToNextItem});

  final bool isSelected;
  final void Function(int) goToNextItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) => state.maybeMap(
        loaded: (loadedState) => CircleActionButton(
          width: 180,
          height: 180,
          text: loadedState.isAlarmPlaying
              ? '${AppLocalizations.of(context)!.stop.toUpperCase()} ${AppLocalizations.of(context)!.alarm.toUpperCase()}'
              : '${AppLocalizations.of(context)!.start.toUpperCase()} ${AppLocalizations.of(context)!.alarm.toUpperCase()}',
          onTap: () {
            if (isSelected) {
              if (loadedState.isAlarmPlaying) {
                sl<AlarmBloc>().add(const AlarmEvent.stopAlarm());
              } else {
                sl<AlarmBloc>().add(const AlarmEvent.playAlarm());
              }
            } else {
              goToNextItem(1);
            }
          },
          gradientColors: const [Color(0xFFE4E4E4), Color(0xFF9B9B9B)],
          isSelected: isSelected,
          isActive: loadedState.isAlarmPlaying,
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _SOSWidget extends StatelessWidget {
  const _SOSWidget(
      {required this.isSelected, required this.goToNextItem, this.position});

  final bool isSelected;
  final void Function(int) goToNextItem;
  final Position? position;

  @override
  Widget build(BuildContext context) {
    return CircleActionButton(
        text: 'SOS',
        onTap: () {
          if (isSelected) {
            sosConfirmationPopup(
              context,
            );
          } else {
            goToNextItem(0);
          }
        },
        isSelected: isSelected);
  }
}
