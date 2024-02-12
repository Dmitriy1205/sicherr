import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/core/const/images.dart';
import 'package:sicherr/presentation/screens/contact_detail/contact_detail.dart';
import 'package:sicherr/presentation/widgets/round_wrapper_icon.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactDetailScreen(),
            ));
      },
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  AppImages.userPlaceholder,
                  height: 42,
                  width: 42,
                )),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            const RoundWrapperIcon(svgPath: AppIcons.phone),
          ],
        ),
      ),
    );
  }
}
