import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:marvel/core/enviroment/env.dart';

class GenerateUtil {
  static String genMarvelHash(Environment env, String timeStamp) {
    final bytes = utf8.encode(
      DateTime.now().millisecondsSinceEpoch.toString() +
          env.apiPrivKey +
          env.apiPubKey,
    );
    return md5.convert(bytes).toString();
  }

  static String genTimeStamp() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}
