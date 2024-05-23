import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sicherr/core/service_locator/service_locator.dart';
import 'package:sicherr/presentation/bloc/alarm/alarm_bloc.dart';
import 'package:sicherr/presentation/screens/home/widgets/circle_action_button.dart';
import 'package:sicherr/presentation/widgets/sos_confirmation_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/entities/contact_entity/contact_entity.dart';
import '../../bloc/contacts/contacts_bloc.dart';
import '../../bloc/emergency_contact/emergency_contact_bloc.dart';
import '../../bloc/shared_contacts/sc_bloc.dart';
import '../../widgets/app_toast.dart';
import '../../widgets/grouped_items/grouped_items.dart';
import '../../widgets/grouped_items/grouped_items_factory.dart';
import '../../widgets/loading_indicator.dart';
import '../../widgets/search_phone_field.dart';
import '../contact_detail/contact_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<EmergencyContactBloc>()
        .add(const EmergencyContactEvent.getAllEmContacts());
    context.read<ScBloc>().add(const ScEvent.getAllSC());
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ContactDetailScreen(contact: state.contact)),
                );
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
                          onChanged: (text) {
                            context.read<EmergencyContactBloc>().add(
                                const EmergencyContactEvent.getAllEmContacts());

                            context
                                .read<ContactsBloc>()
                                .add(ContactsEvent.searchContact(text));
                          },
                        ),
                      ),
                      _searchTextController.text.isEmpty
                          ? const Expanded(
                              child: HomeButtonsSlider(),
                            )
                          : ContactListDisplayed(
                              groupedContacts: state.categorizedContacts,
                              searchingNumber: _searchTextController.text,
                            )
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
            Spacer(),
            _SOSWidget(
              position: position,
              isSelected: true,
              goToNextItem: _goToNextButton,
            ),
            SizedBox(
              height: 25,
            ),
            _StartAlarm(
              isSelected: true,
              goToNextItem: _goToNextButton,
            ),
            Spacer()
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

class _StartAlarm extends StatelessWidget {
  const _StartAlarm({required this.isSelected, required this.goToNextItem});

  final bool isSelected;
  final void Function(int) goToNextItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlarmBloc, AlarmState>(
      builder: (context, state) => state.maybeMap(
        loaded: (loadedState) => CircleActionButton(
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
            sosConfirmationPopup(context,
                latitude: position?.latitude.toString(),
                longitude: position?.longitude.toString());
          } else {
            goToNextItem(0);
          }
        },
        isSelected: isSelected);
  }
}
