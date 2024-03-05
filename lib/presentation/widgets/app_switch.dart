import 'package:flutter/material.dart';

import '../../core/const/colors.dart';

class AppSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const AppSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 40.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: _value
              ? AppColors.mainAccent.withOpacity(0.5)
              : AppColors.mediumGrey.withOpacity(0.3),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _value ? 20.0 : 0.0,
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _value
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
