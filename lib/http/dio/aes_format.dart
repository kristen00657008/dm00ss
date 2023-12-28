import 'package:dm00ss/http/api_config.dart';
import 'package:encrypt/encrypt.dart' as Encrypt;
import 'package:encrypt/encrypt.dart';

class AesFormat {
  /// 傳出加密
  static String encrypt(String originJson, {String aesKey = ApiConfig.aesKey}) {
    try {
      final key = Encrypt.Key.fromUtf8(aesKey); //加密key
      final iv = Encrypt.IV.fromUtf8(aesKey); //偏移量

      final encrypter = Encrypt.Encrypter(Encrypt.AES(key, mode: Encrypt.AESMode.cbc));
      final encrypted = encrypter.encrypt(originJson, iv: iv);

      return encrypted.base64;
    } catch (e) {
      throw ArgumentError(e);
    }
  }

  /// 解密
  static String decrypt(String originJson) {
    try {
      final key = Encrypt.Key.fromUtf8(ApiConfig.aesKey); //加密key
      final iv = Encrypt.IV.fromUtf8(ApiConfig.aesKey); //偏移量

      final encrypter = Encrypt.Encrypter(Encrypt.AES(key, mode: Encrypt.AESMode.cbc));
      final decrypted = encrypter.decrypt(Encrypted.fromBase64(originJson), iv: iv);

      return decrypted;
    } catch (e) {
      throw ArgumentError(e);
    }
  }
}
