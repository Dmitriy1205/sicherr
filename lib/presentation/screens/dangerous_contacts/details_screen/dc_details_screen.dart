import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/additional_content.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/details_screen/add_dc_tag_screen.dart';
import 'package:sicherr/presentation/screens/dangerous_contacts/details_screen/show_dc_tags.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../bloc/shared_contacts/sc_bloc.dart';

class DCDetailScreen extends StatefulWidget {
  const DCDetailScreen({super.key, required this.contact});

  final ContactEntity contact;

  @override
  State<DCDetailScreen> createState() => _DCDetailScreenState();
}

class _DCDetailScreenState extends State<DCDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScBloc, ScState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const DefaultAppBar(),
          body: SafeArea(
            child: state.maybeMap(
              loading: (_) => const LoadingIndicator(),
              orElse: () {
                final sharedContact = state.sc!
                    .firstWhere((element) => element.id == widget.contact.id);
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContactInfo(
                            contact: widget.contact,
                            isEmergency: false,
                            isDanger: true,
                            showRating: true,
                          ),
                          const SizedBox(height: 30),
                          ActionTextBotBnt(
                            icon: const RoundWrapperIcon(
                                icon: Icons.person_add_alt_1),
                            text: AppLocalizations.of(context)!.addTag,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => AddDCTagScreen(
                                    contactId: widget.contact.id,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    ShowDCTags(
                      contact: sharedContact,
                    ),
                    // const Divider(height: 1),
                    AdditionalContentBlock(
                      contact: widget.contact,
                      badRating: sharedContact.ratings
                          .where((element) => element.rating == 'Bad')
                          .length
                          .toDouble(),
                      goodRating: sharedContact.ratings
                          .where((element) => element.rating == 'Good')
                          .length
                          .toDouble(),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
