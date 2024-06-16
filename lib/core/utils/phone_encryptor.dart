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
      final base64 = encrypted.base64;
      return _replaceSlash(base64);
    } catch (_) {
      return phoneNumber;
    }
  }

  String decrypt(String encryptedPhoneNumber) {
    try {
      final formatted = _returnSlashBack(encryptedPhoneNumber);
      final decrypted = _encryptor.decrypt64(formatted, iv: _iv);
      return decrypted;
    } catch (_) {
      return encryptedPhoneNumber;
    }
  }

  String _replaceSlash(String val){
    return val.replaceAll("/", "\\");
  }

  String _returnSlashBack(String val){
    return val.replaceAll("\\", "/");
  }
}
