import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/presentation/bloc/contact_details/contact_details_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/add_tag.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DisplayTagsScreen extends StatelessWidget {
  const DisplayTagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: AppLocalizations.of(context)!.tag,
        icon: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: context.read<ContactDetailsBloc>(),
                        child: const AddTagScreen(),
                      )),
            );
          },
          child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text(
                AppLocalizations.of(context)!.addTag,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ),
      ),
      body: BlocBuilder<ContactDetailsBloc, ContactDetailsState>(
        builder: (context, state) {
          return state.maybeMap(
              loaded: (state) => ListView.separated(
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppIcons.hashtag,
                              color: Theme.of(context).primaryColor,
                              height: 18.2,
                              width: 16.2,
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                state.detailedContact.tags[i],
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int _) {
                      return const Divider(
                        height: 1,
                        color: AppColors.lightGrey,
                      );
                    },
                    itemCount: state.detailedContact.tags.length,
                  ),
              orElse: () => const Center(
                    child: CircularProgressIndicator(),
                  ));
        },
      ),
    );
  }
}
