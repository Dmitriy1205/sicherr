import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/strings.dart';
import 'package:sicherr/presentation/widgets/app_elevated_button.dart';
import 'package:sicherr/presentation/widgets/scrollable_contacts_list.dart';

import '../../core/const/colors.dart';
import '../../core/theme/theme.dart';

void sosConfirmationPopup(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      insetPadding: const EdgeInsets.all(35),
      title: Center(
        child: Text(
          'SOS',
          style: AppTheme.themeData.textTheme.displayLarge,
        ),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.sosDescription,
              textAlign: TextAlign.center,
              style: AppTheme.themeData.textTheme.titleMedium!
                  .copyWith(color: AppColors.greyDark),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 135,
              width: MediaQuery.of(context).size.width,
              child: const ScrollableContactList(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.message),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(AppStrings.message,style: AppTheme.themeData.textTheme.labelSmall!.copyWith(color: AppColors.black),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.check,
                            size: 15,
                            color: AppColors.greenLight,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            AppStrings.geolocation,
                            style: AppTheme.themeData.textTheme.titleSmall!
                                .copyWith(fontWeight: FontWeight.w400,color: AppColors.greenLight),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18,),
                  Text(
                    'Help me!!! If you see this message it ...',
                    style: AppTheme.themeData.textTheme.titleSmall!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
      actions: <Widget>[
        AppElevatedButton(
            text: '${AppStrings.send} SOS',
            style: AppTheme.themeData.textTheme.labelSmall,
            onPressed: () {}),
      ],
    ),
  );
}
