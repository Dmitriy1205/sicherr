import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/theme/theme.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/localization_utils.dart';
import '../../../bloc/shared_contacts/sc_bloc.dart';
import '../../../widgets/app_dropdown_picker.dart';


class AddDCTagScreen extends StatefulWidget {
  final String contactId;
  const AddDCTagScreen({super.key, required this.contactId});

  @override
  State<AddDCTagScreen> createState() => _AddDCTagScreenState();
}

class _AddDCTagScreenState extends State<AddDCTagScreen> {
  // final textController = TextEditingController();
  String? tagName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.addTag,
      ),
      body: BlocConsumer<ScBloc, ScState>(
        listener: (context, state) {
          state.maybeMap(
              orElse: () {},
              loaded: (_) => Navigator.pop(context)
          );
        },
        builder: (context, state) {
          return state.maybeMap(
              loading: (_) => const Center(child: LoadingIndicator()),
              orElse: () => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Text(
                        AppLocalizations.of(context)!.addTagDesc,
                        style: AppTheme.themeData.textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(height: 28),
                    AppDropdownPicker(
                      onChange: (v) {
                        setState(() {
                          tagName = v;
                        });
                      },
                      items: LocalizationUtils(context: context)
                          .localizedDangerousTags(),
                    ),
                    // SizedBox(
                    //     height: 47,
                    //     child: TextField(
                    //       controller: textController,
                    //       decoration: InputDecoration(
                    //         hintText:
                    //             AppLocalizations.of(context)!.enterTag,
                    //         hintStyle:
                    //             const TextStyle(color: AppColors.grey),
                    //       ),
                    //       onSubmitted: (text) {
                    //         context
                    //             .read<ContactDetailsBloc>()
                    //             .add(ContactDetailsEvent.addTag(text));
                    //       },
                    //     )),
                    const Spacer(),
                    AppElevatedButton(
                      text: 'Add',
                      widget: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 28.0),
                        child: Text(AppLocalizations.of(context)!.add),
                      ),
                      onPressed: tagName== null ?null: () {
                        context
                            .read<ScBloc>()
                            .add(ScEvent.addTag(contactId:widget.contactId , taName: tagName!));
                      },
                      width: 0,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.white),
                      borderRadius: 30,
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 30),
                    //   child: AppElevatedButton(
                    //     text: AppLocalizations.of(context)!.addTag,
                    //     style: const TextStyle(
                    //         fontSize: 16, fontWeight: FontWeight.w500),
                    //     onPressed: () {
                    //       FocusScope.of(context).unfocus();
                    //       context.read<ContactDetailsBloc>().add(
                    //           ContactDetailsEvent.addTag(
                    //               textController.text));
                    //       textController.clear();
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
