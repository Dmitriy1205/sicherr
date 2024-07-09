import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sicherr/presentation/bloc/documents/documents_cubit.dart';
import 'package:sicherr/presentation/screens/documents/document.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {

  @override
  void initState() {
    context.read<DocumentsCubit>().fetchTermsAndServices();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final content = context.watch<DocumentsCubit>().state.documents.termsHTML;
    return DocumentScreen(title: AppLocalizations.of(context)!.support, htmlBody: content);
  }
}
