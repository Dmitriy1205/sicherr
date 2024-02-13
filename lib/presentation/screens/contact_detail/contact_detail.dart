import 'package:flutter/material.dart';
import 'package:sicherr/core/const/colors.dart';
import 'package:sicherr/core/const/icons.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/additional_content.dart';
import 'package:sicherr/presentation/screens/contact_detail/widgets/contact_info.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightGrey,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
            onTap: () => {Navigator.pop(context)},
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ContactInfo(),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          const RoundWrapperIcon(svgPath: AppIcons.phone),
                          const SizedBox(height: 10),
                          Text(
                            'Call',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const AdditionalContentBlock(),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Subscribe only',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: AppElevatedButton(
                  text: 'Subscribe',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                  onPressed: () {
                    print('TODO Subscribe');
                  },
                ),
              )
            ],
          ),
        ));
  }
}