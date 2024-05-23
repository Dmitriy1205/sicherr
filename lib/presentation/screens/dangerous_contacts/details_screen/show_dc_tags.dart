import 'package:flutter/material.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/widgets/svg_round_wrapper_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'display_dc_tags_screen.dart';

class ShowDCTags extends StatelessWidget {
  const ShowDCTags({
    super.key,
    required this.contact,
  });

  final ContactEntity contact;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>  DisplayDCTagsScreen(contact: contact,),
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
              AppLocalizations.of(context)!.showNumTags(contact.tags.length.toString()),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
