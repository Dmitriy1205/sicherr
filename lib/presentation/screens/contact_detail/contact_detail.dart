import 'package:flutter/material.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/additional_content.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({super.key, required this.contact});
  final ContactEntity contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGrey,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => {Navigator.pop(context)},
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactInfo(contact: contact),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: GestureDetector(
                        onTap: () {
                          ContactsManager.launchCall(
                              phoneNumber: contact.getMainPhoneNumber);
                        },
                        child: Column(
                          children: [
                            const RoundWrapperIcon(svgPath: AppIcons.phone),
                            const SizedBox(height: 10),
                            Text(
                              AppLocalizations.of(context)!.call,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const AdditionalContentBlock(),
              const Spacer(),
               Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    AppLocalizations.of(context)!.subscribeOnly,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppElevatedButton(
                  text: AppLocalizations.of(context)!.subscribe,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onPressed: () {
                    print('TODO: Subscribe');
                  },
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
  }
}
