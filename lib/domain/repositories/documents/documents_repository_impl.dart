import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sicherr/domain/repositories/documents/documents_repository_contract.dart';

const _termsKey = 'terms';
const _supportKey = 'support';
const _contentsCollectionKey = 'contents';
const _defaultLanguageCode = 'en';

class DocumentsRepositoryImpl implements DocumentsRepository {
  final FirebaseFirestore _db;
  final String _languageCode;

  @override
  Future<String> getSupportHTML() async {
    final supportContents =
        await _db.collection(_contentsCollectionKey).doc(_supportKey).get();
    return supportContents.get(_languageCode) ??
        supportContents.get(_defaultLanguageCode);
  }

  @override
  Future<String> getTermsAndServicesHTML() async {
    final termsAndServicesContents =
        await _db.collection(_contentsCollectionKey).doc(_termsKey).get();
    return termsAndServicesContents.get(_languageCode) ??
        termsAndServicesContents.get(_defaultLanguageCode);
  }

  const DocumentsRepositoryImpl({
    required FirebaseFirestore db,
    required String languageCode,
  })  : _db = db,
        _languageCode = languageCode;
}
