import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/presentation/bloc/documents/documents_cubit.dart';
import 'package:sicherr/presentation/screens/documents/document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {

  @override
  void initState() {
    context.read<DocumentsCubit>().fetchSupport();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final content = context.watch<DocumentsCubit>().state.documents.supportHTML;
    return DocumentScreen(title: AppLocalizations.of(context)!.support, htmlBody: content);
  }
}
