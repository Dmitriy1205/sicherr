import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/contact_details/contact_details_bloc.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/show_tags.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdditionalContentBlock extends StatelessWidget {
  final ContactEntity contact;
  final double ratingByUser;
  const AdditionalContentBlock({
    super.key,
    required this.contact,
    required this.ratingByUser,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowTags(
          tags: contact.tags,
        ),
        const Divider(height: 1),
        Container(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.rateThisContact,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              RatingBar.builder(
                initialRating: ratingByUser,
                minRating: 1,
                maxRating: 5,
                allowHalfRating: false,
                direction: Axis.horizontal,
                itemCount: 5,
                itemSize: 22,
                itemBuilder: (context, i) => Icon(
                  i < (ratingByUser) ? Icons.star : Icons.star_border,
                  color: AppColors.yellow,
                ),
                unratedColor: Colors.black,
                onRatingUpdate: (rating) {
                  context
                      .read<ContactDetailsBloc>()
                      .add(ContactDetailsEvent.rateContact(rating));
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
