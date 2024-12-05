import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/const/colors.dart';

class AppCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color borderColor;

  const AppCheckbox({super.key,
    required this.value,
    required this.onChanged,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? AppColors.white :AppColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color:value ? AppColors.lightGrey : borderColor,
            width: 1.5,
          ),
        ),
        child: value
            ? const Center(
              child: FaIcon(
          FontAwesomeIcons.check,
          color: AppColors.mainAccent,
          size: 17,
        ),
            )
            : null,
      ),
    );
  }
}
