import 'package:flutter/material.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/presentation/widgets/round_wrapper_icon.dart';

class ShowTags extends StatelessWidget {
  const ShowTags({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Row(
        children: [
          RoundWrapperIcon(
            svgPath: AppIcons.hashtag,
            width: 16.2,
            height: 18.2,
            padding: 12,
          ),
          SizedBox(width: 15),
          Text(
            'Show 25 tags',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}