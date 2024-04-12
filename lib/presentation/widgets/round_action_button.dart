import 'package:flutter/material.dart';

class ActionTextBotBnt extends StatelessWidget {
  const ActionTextBotBnt({
    super.key,
    required this.icon,
    required this.text,
    this.padding = 5.0,
    this.onTap,
  });
  final Widget icon;
  final String text;
  final double padding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            icon,
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
