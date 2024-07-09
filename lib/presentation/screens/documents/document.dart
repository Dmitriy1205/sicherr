import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sicherr/presentation/widgets/core_widgets.dart';

class DocumentScreen extends StatelessWidget {
  final String title;
  final String htmlBody;
  const DocumentScreen({super.key, required this.title, required this.htmlBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: title,
      ),
      body: HtmlWidget(htmlBody),
    );
  }
}
