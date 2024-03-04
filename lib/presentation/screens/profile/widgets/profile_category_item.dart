import 'package:flutter/material.dart';
import 'package:sicherr/presentation/screens/profile/model/models.dart';

class ProfileCategoryItem extends StatelessWidget {
  const ProfileCategoryItem({
    super.key,
    required this.item,
    this.icon = const Icon(
      Icons.arrow_forward_ios_sharp,
      size: 20,
    ),
  });

  final ProfileSectionItem item;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: item.action,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  item.text,
                  style: const TextStyle(fontSize: 14),
                )),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ],
    );
  }
}
