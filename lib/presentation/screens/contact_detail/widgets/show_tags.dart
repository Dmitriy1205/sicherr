import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/presentation/bloc/contact_details/contact_details_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/display_tags.dart';
import 'package:sicherr/presentation/widgets/svg_round_wrapper_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowTags extends StatelessWidget {
  const ShowTags({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: context.read<ContactDetailsBloc>(),
                child: const DisplayTagsScreen(),
              ),
            ));
      },
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const SvgRoundWrapperIcon(
              svgPath: AppIcons.hashtag,
              width: 16.2,
              height: 18.2,
              padding: 12,
            ),
            const SizedBox(width: 15),
            Text(
              AppLocalizations.of(context)!.showNumTags(tags.length.toString()),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
