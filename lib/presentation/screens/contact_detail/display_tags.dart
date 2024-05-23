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
                  builder: (_) => const AddTagScreen()),
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
            loaded: (state) {
              Map<String, int> tagCounts = {};

              for (var tag in state.detailedContact.tags) {
                if (!tagCounts.containsKey(tag)) {
                  tagCounts[tag] = 1;
                } else {
                  tagCounts[tag] = tagCounts[tag]! + 1;
                }
              }

              List<String> uniqueTags = tagCounts.keys.toList();

              return ListView.separated(
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
                            uniqueTags[i],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        tagCounts[uniqueTags[i]] == 1
                            ? const SizedBox()
                            : Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.mainAccent,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Center(
                                    child: Text(
                                  '${tagCounts[uniqueTags[i]]}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          fontSize: 16,
                                          color: AppColors.mainAccent),
                                )),
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
                itemCount: uniqueTags.length,
              );
            },
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
