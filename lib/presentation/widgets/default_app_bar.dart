
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/theme/theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.title, this.icon});

  final String title;
  final Widget? icon;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.lightGrey,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SizedBox(
              width: 25,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  color: AppColors.black,
                  size: 20,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              style: AppTheme.themeData.textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          if (icon != null) icon!
        ],
      ),
    );
  }
}
