import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/utils/bytes_from_firebase_storage.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/bloc/notifications_enabled/notifications_enabled_cubit.dart';
import 'package:sicherr/presentation/bloc/profile/profile_bloc.dart';
import 'package:sicherr/presentation/screens/alarm_tone/alarm_tone.dart';
import 'package:sicherr/presentation/screens/change_phone_number/change_phone_number.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/screens/contacts/contacts.dart';
import 'package:sicherr/presentation/screens/documents/support.dart';
import 'package:sicherr/presentation/screens/documents/terms.dart';
import 'package:sicherr/presentation/screens/licenses/licenses.dart';
import 'package:sicherr/presentation/screens/profile/model/models.dart';
import 'package:sicherr/presentation/screens/profile/sos/sos_screen.dart';
import 'package:sicherr/presentation/screens/profile/widgets/profile_category_item.dart';
import 'package:sicherr/presentation/screens/profile/widgets/profile_category_label.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/presentation/widgets/app_switch.dart';

import '../../bloc/notification/notification_bloc.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    //TODO: need to refactor when we'll have some user repo
    context.read<NotificationsEnabledCubit>().initWithSavedValue();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.resumed){
      context.read<NotificationsEnabledCubit>().initWithSavedValue();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  ContactEntity? user;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc,ProfileState>(
      listener: (context,state) async{
        if(state.profileInfo != null){
          final photoURL = context.read<ProfileBloc>().state.profileInfo!.photoURL;
          final firebaseUser = context.read<AuthBloc>().state.user;
          final image = photoURL == null ? null : await getBytesFromFirestoreStorage(photoURL);
          setState(() {
            user = ContactEntity(id: '-1', name: AppLocalizations.of(context)!.account, phoneNumber: firebaseUser!.phoneNumber!, image: image);
          });
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                user == null ? SizedBox.shrink() : ContactInfo(contact: user!, isEmergency: false,),
                const SizedBox(height: 30),
                ProfileSection(
                  items: [
                    ProfileSectionModel(
                      category: AppLocalizations.of(context)!.features,
                      items: [
                        ProfileSectionItem(
                          text: AppLocalizations.of(context)!.alarmTone,
                          action: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AlarmTone())),
                        ),
                        ProfileSectionItem(
                          text: 'SOS',
                          action: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SosScreen())),
                        ),
                      ],
                    ),
                    ProfileSectionModel(
                      category: AppLocalizations.of(context)!.account,
                      items: [
                        ProfileSectionItem(
                          text: AppLocalizations.of(context)!.change_photo,
                          action: () async{
                            final image = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 256, maxHeight: 256);
                            if(image == null || !mounted) return;
                            context.read<ProfileBloc>().add(ProfileEvent.setPhoto(filePath: image.path));
                          },
                        ),
                        ProfileSectionItem(
                          text: AppLocalizations.of(context)!.contacts,
                          action: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ContactsScreen())),
                        ),
                        ProfileSectionItem(
                          text: AppLocalizations.of(context)!.notifications,
                          icon: AppSwitch(
                            value: context.watch<NotificationsEnabledCubit>().state,
                            onChanged: (value){
                              final toggledValue = !value;
                              if(!toggledValue){
                                context.read<NotificationBloc>().add(const NotificationEvent.deleteToken());
                              }else{
                                context.read<NotificationBloc>().add(const NotificationEvent.addToken());
                              }
                              context.read<NotificationsEnabledCubit>().set(!value);
                            },
                          ),
                          action: null,
                        ),
                        ProfileSectionItem(
                          text: AppLocalizations.of(context)!.change_phone_number,
                          action: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangePhoneNumberScreen())),
                        ),
                        ProfileSectionItem(
                            text: AppLocalizations.of(context)!.logout,
                            action: () {
                              context.read<NotificationBloc>().add(const NotificationEvent.deleteToken());
                              BlocProvider.of<AuthBloc>(context)
                                  .add(const AuthEvent.logout());
                            })
                      ],
                    ),
                    ProfileSectionModel(category: 'App', items: [
                      ProfileSectionItem(
                        text: AppLocalizations.of(context)!.license,
                        action: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LicensesScreen())),
                      ),
                      ProfileSectionItem(
                        text: AppLocalizations.of(context)!.terms,
                        action: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TermsScreen())),
                      ),
                      ProfileSectionItem(
                        text: AppLocalizations.of(context)!.support,
                        action: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SupportScreen())),
                      ),
                    ])
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.items,
  });

  final List<ProfileSectionModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (section) => Column(
              children: [
                ProfileCategoryLabel(text: section.category),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: AppColors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: section.items.asMap().entries.map((entry) {
                      final int itemIndex = entry.key;
                      final item = entry.value;
                      final icon = item.icon;
                      return Column(
                        children: [
                          ProfileCategoryItem(item: item, icon: icon),
                          if (itemIndex < section.items.length - 1)
                            const Divider(height: 0.5),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          )
          .toList(),
    );
  }
}
