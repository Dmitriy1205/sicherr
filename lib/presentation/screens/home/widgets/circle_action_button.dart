import 'package:flutter/material.dart';

class CircleActionButton extends StatelessWidget {
  const CircleActionButton({
    required this.text,
    required this.isSelected,
    super.key,
    this.onTap,
    this.gradientColors,
    this.activeTextColor = const Color(0xFFAB4185),
    this.isActive = false,
  });
  final void Function()? onTap;
  final List<Color>? gradientColors;
  final String text;
  final bool isSelected;
  final bool isActive;
  final Color activeTextColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isSelected ? 1 : 0.4,
      duration: const Duration(milliseconds: 200),
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors != null
                ? gradientColors!
                : [
                    const Color(0xFFF6B1DD),
                    Theme.of(context).primaryColor,
                  ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            padding: EdgeInsets.zero,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: isActive ? activeTextColor : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
