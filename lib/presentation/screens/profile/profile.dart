import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/screens/alarm_tone/alarm_tone.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/screens/profile/model/models.dart';
import 'package:sicherr/presentation/screens/profile/sos/sos_screen.dart';
import 'package:sicherr/presentation/screens/profile/widgets/profile_category_item.dart';
import 'package:sicherr/presentation/screens/profile/widgets/profile_category_label.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../bloc/notification/notification_bloc.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    //TODO: need to refactor when we'll have some user repo
    final firebaseUser = FirebaseAuth.instance.currentUser;
    user = firebaseUser != null
        ? ContactEntity.fromFirebaseUser(firebaseUser)
        : ContactEntity(id: '-1', name: AppLocalizations.of(context)!.account, phones: ['-']);
  }

  late final ContactEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ContactInfo(contact: user, isEmergency: false,),
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
                      ProfileSectionItem(
                        text: AppLocalizations.of(context)!.quickAlarm,
                        action: () => print('Quick Warning'),
                      ),
                    ],
                  ),
                  ProfileSectionModel(
                    category: AppLocalizations.of(context)!.account,
                    items: [
                      ProfileSectionItem(
                          text: AppLocalizations.of(context)!.logout,
                          action: () {
                            context.read<NotificationBloc>().add(const NotificationEvent.removeToken());
                            BlocProvider.of<AuthBloc>(context)
                                .add(const AuthEvent.logout());
                          })
                    ],
                  ),
                ],
              ),
            ],
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
                      return Column(
                        children: [
                          ProfileCategoryItem(item: item),
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
