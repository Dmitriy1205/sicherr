import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sicherr/core/theme/theme.dart';

class AppDialogs {
  static void showDeviationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.attention),
                const SizedBox(height: 35,),
                Text(AppLocalizations.of(context)!.youLeftTheRoute,style: AppTheme.themeData.textTheme.displayLarge!.copyWith(fontSize: 22),),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showNavigationFailed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(AppIcons.warning, color: AppColors.red, width: 55,),
                const SizedBox(height: 35,),
                Text(AppLocalizations.of(context)!.left_route,style: AppTheme.themeData.textTheme.displayLarge!.copyWith(fontSize: 22), textAlign: TextAlign.center,),
              ],
            ),
          ),
        );
      },
    );
  }

  static void showArrivedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(AppImages.check),
                const SizedBox(height: 35,),
                Text(AppLocalizations.of(context)!.youHaveArrived,style: AppTheme.themeData.textTheme.displayLarge!.copyWith(fontSize: 22),),
              ],
            ),
          ),
        );
      },
    );
  }
}
