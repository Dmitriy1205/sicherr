import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

Future<Uint8List?> getBytesFromFirestoreStorage(String imagePath) async {
  try {
    final ref = FirebaseStorage.instance.ref().child(imagePath);
    final Uint8List? data = await ref.getData();
    return data;
  } catch (e) {
    print('Error fetching image data: $e');
    return null;
  }
}