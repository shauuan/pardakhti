import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

abstract final class PasswordHasher {
  static String randomSalt([int length = 16]) {
    final r = Random.secure();
    final bytes = List<int>.generate(length, (_) => r.nextInt(256));
    return base64UrlEncode(bytes);
  }

  static String hash(String password, String salt) {
    final bytes = utf8.encode('$salt::$password');
    return sha256.convert(bytes).toString();
  }

  static bool verify(String password, String salt, String hashValue) {
    return hash(password, salt) == hashValue;
  }

  static String recoveryKey() {
    final r = Random.secure();
    final parts = List.generate(4, (_) {
      return List.generate(4, (_) => r.nextInt(16).toRadixString(16)).join();
    });
    return parts.join('-').toUpperCase();
  }
}
