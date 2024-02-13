import 'package:flutter/material.dart';
import 'package:sicherr/core/const/strings.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text(AppStrings.terms)),
    );
  }
}
