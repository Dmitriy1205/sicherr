import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/theme/theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar(
      {super.key, this.title, this.icon, this.showBackButton = true});

  final String? title;
  final Widget? icon;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.lightGrey,
      leading: showBackButton && Navigator.canPop(context)
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.pop(context);
              },
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColors.black,
                    size: 23,
                  ),
                ),
              ),
            )
          : null,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: AppTheme.themeData.textTheme.displayLarge,
        textAlign: TextAlign.center,
      ),
      actions: [if (icon != null) icon!],
    );
  }
}
