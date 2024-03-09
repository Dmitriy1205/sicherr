import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class AppSwitch extends StatefulWidget {
   bool value;
  final ValueChanged<bool> onChanged;

   AppSwitch({
    Key? key,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 40.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: widget.value
              ? AppColors.mainAccent.withOpacity(0.5)
              : AppColors.mediumGrey.withOpacity(0.3),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: widget.value ? 20.0 : 0.0,
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.value
                      ? AppColors.mainAccent
                      : AppColors.mainAccent.withOpacity(0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
