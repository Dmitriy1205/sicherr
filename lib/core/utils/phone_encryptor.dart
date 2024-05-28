import 'package:encrypt/encrypt.dart';

class PhoneNumberEncryptor {
  //final String _keyString = 'hJfP5rDgJQEFhG1JY+mP2gPj9efvDsN4C4oeaROOQi4=';
  final String _keyString = 'bTRrZm50dWE3OHZhdWZudA==';
  final String _ivString = 'Jktlg2&kjl#ctk5@';

  late final Key _key;
  late final IV _iv;
  late final Encrypter _encryptor;

  PhoneNumberEncryptor() {
    _key = Key.fromBase64(_keyString);
    _iv = IV.fromUtf8(_ivString);
    _encryptor = Encrypter(AES(_key, mode: AESMode.cbc,padding: "PKCS7"));
  }

  String encrypt(String phoneNumber) {
    try {
      final encrypted = _encryptor.encrypt(phoneNumber, iv: _iv);
      return encrypted.base64;
    } catch (_) {
      return phoneNumber;
    }
  }

  String decrypt(String encryptedPhoneNumber) {
    try {
      final decrypted = _encryptor.decrypt64(encryptedPhoneNumber, iv: _iv);
      return decrypted;
    } catch (_) {
      return encryptedPhoneNumber;
    }
  }
}
