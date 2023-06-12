import 'dart:convert';
import 'package:crypto/crypto.dart';

class GenerateUtil {
  static String genMarvelHash(
    String apiPrivKey,
    String apiPubKey,
    String timeStamp,
  ) {
    final bytes = utf8.encode(
      DateTime.now().millisecondsSinceEpoch.toString() + apiPrivKey + apiPubKey,
    );
    return md5.convert(bytes).toString();
  }

  static String genTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
