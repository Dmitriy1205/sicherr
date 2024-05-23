import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/presentation/bloc/auth/auth_bloc.dart';
import 'package:sicherr/presentation/bloc/shared_contacts/sc_bloc.dart';
import 'package:sicherr/presentation/bloc/users_length/users_lentgh_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AdditionalContentBlock extends StatelessWidget {
  final ContactEntity contact;
  final double goodRating;
  final double badRating;

  const AdditionalContentBlock({
    super.key,
    required this.contact,
    required this.goodRating,
    required this.badRating,
  });

  @override
  Widget build(BuildContext context) {
    final userPhoneNumber = context.read<AuthBloc>().state.user!.phoneNumber;

    final sharedContact = context
        .read<ScBloc>()
        .state
        .sc!
        .firstWhere((element) => element.id == contact.id);
    final bool isBadRated = sharedContact.ratings.any((rating) =>
        rating.fromUserId == userPhoneNumber && rating.rating == 'Bad');
    final bool isGoodRated = sharedContact.ratings.any((rating) =>
        rating.fromUserId == userPhoneNumber && rating.rating == 'Good');
    final usersLength = context.watch<UsersLengthCubit>().state.usersLength.toDouble();
    final validUsersLength = usersLength > 0 ? usersLength : 1.0;

    final validGoodRating = goodRating.isNaN || goodRating.isInfinite ? 0 : goodRating;
    final validBadRating = badRating.isNaN || badRating.isInfinite ? 0 : badRating;

    final goodRatingPercentage = validGoodRating / validUsersLength;
    final badRatingPercentage = validBadRating / validUsersLength;
    return Column(
      children: [
        // ShowTags(
        //   tags: contact.tags,
        // ),
        const Divider(height: 1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  AppLocalizations.of(context)!.rateThisContact,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(30)),
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 23, horizontal: 25.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (!isBadRated) {
                              context.read<ScBloc>().add(
                                  ScEvent.addRemoveRating(
                                      contactId: sharedContact.id,
                                      rate: 'Good'));
                            }
                          },
                          child: SizedBox(
                            height: 48,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: LinearProgressIndicator(
                                    value: goodRatingPercentage,
                                    backgroundColor: AppColors.white,
                                    color: AppColors.lightPink,
                                    minHeight: 48,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(
                                           AppLocalizations.of(context)!.good,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          '${goodRating.toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // RatingBar.builder(
                        //   initialRating: ratingByUser,
                        //   minRating: 10,
                        //   maxRating: 100,
                        //   allowHalfRating: false,
                        //   direction: Axis.horizontal,
                        //   itemCount: 1,
                        //   itemSize: 48,
                        //   itemBuilder: (context, i) => Container(
                        //     child: Icon(
                        //       i < (ratingByUser)
                        //           ? Icons.star
                        //           : Icons.star_border,
                        //       color: AppColors.yellow,
                        //     ),
                        //   ),
                        //   unratedColor: Colors.black,
                        //   onRatingUpdate: (rating) {
                        //     context
                        //         .read<ContactDetailsBloc>()
                        //         .add(ContactDetailsEvent.rateContact(rating));
                        //   },
                        // ),
                        // ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (!isGoodRated) {
                              context.read<ScBloc>().add(
                                  ScEvent.addRemoveRating(
                                      contactId: sharedContact.id,
                                      rate: 'Bad'));
                            }
                          },
                          child: SizedBox(
                            height: 48,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: LinearProgressIndicator(
                                    value: badRatingPercentage,
                                    backgroundColor: AppColors.white,
                                    color: AppColors.lightPink,
                                    minHeight: 48,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                         Text(
                                           AppLocalizations.of(context)!.bad,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        Text(
                                          '${badRating.toStringAsFixed(0)}%',
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 48,
                        //   decoration: BoxDecoration(
                        //       color: AppColors.white,
                        //       borderRadius: BorderRadius.circular(16)),
                        //   child: RatingBar.builder(
                        //     initialRating: ratingByUser,
                        //     minRating: 1,
                        //     maxRating: 5,
                        //     allowHalfRating: false,
                        //     direction: Axis.horizontal,
                        //     itemCount: 5,
                        //     itemSize: 22,
                        //     itemBuilder: (context, i) => Column(
                        //       children: [
                        //         Icon(
                        //           i < (ratingByUser)
                        //               ? Icons.star
                        //               : Icons.star_border,
                        //           color: AppColors.yellow,
                        //         ),
                        //       ],
                        //     ),
                        //     unratedColor: Colors.black,
                        //     onRatingUpdate: (rating) {
                        //       context
                        //           .read<ContactDetailsBloc>()
                        //           .add(ContactDetailsEvent.rateContact(rating));
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
