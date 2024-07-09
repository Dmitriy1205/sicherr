import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/documents/documents.dart';

import '../../../domain/repositories/documents/documents_repository_contract.dart';

part 'documents_state.dart';

part 'documents_cubit.freezed.dart';

class DocumentsCubit extends Cubit<DocumentsState> {
  final DocumentsRepository _documentsRepository;

  DocumentsCubit({required DocumentsRepository documentsRepository})
      : _documentsRepository = documentsRepository,
        super(const DocumentsState.initial());

  Future<void> fetchTermsAndServices() async {
    final termsHTML = await _documentsRepository.getTermsAndServicesHTML();
    emit(DocumentsState.loaded(
        documents: state.documents.copyWith(termsHTML: termsHTML)));
  }

  Future<void> fetchSupport() async {
    final supportHTML = await _documentsRepository.getTermsAndServicesHTML();
    emit(DocumentsState.loaded(
        documents: state.documents.copyWith(supportHTML: supportHTML)));
  }
}
