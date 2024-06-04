import 'package:flutter/material.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/core/utils/phone_encryptor.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/rating_stars.dart';

import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/name_formatter.dart';
import '../../../widgets/round_sos_icon.dart';

class ContactInfo extends StatelessWidget {
  final bool isEmergency;
  final bool? isDanger;

  const ContactInfo({
    super.key,
    required this.contact,
    required this.isEmergency,
    this.showRating = false,
    this.isDanger,
  });

  final ContactEntity contact;
  final bool showRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF646464)),
            shape: BoxShape.circle,
          ),
          child: ClipOval(
            child: contact.image != null && contact.image!.isNotEmpty
                ? Image.memory(
                    contact.image!,
                    height: 70,
                    width: 70,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    AppImages.userPlaceholder,
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child:isDanger != null?
                    Text(
                      NameFormatter.formatName(
                        context: context,
                        name: contact.name,
                      ),
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ) : Text(
                      contact.name.isNotEmpty
                          ? contact.name
                          : AppLocalizations.of(context)!.account,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  if (isEmergency)
                    const RoundSosIcon(
                      height: 20,
                      width: 20,
                      fontSize: 6.11,
                    ),
                  if (contact.rating != null && showRating)
                    RatingStars(rating: contact.rating ?? 0),
                ],
              ),
              Text(
                contact.phoneNumber,
                style: const TextStyle(fontSize: 16, color: Color(0xFF838383)),
              )
            ],
          ),
        )
      ],
    );
  }
}
