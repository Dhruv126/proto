import 'dart:async';

import 'package:proto/core/services/services.dart';

class NetworkUtils {
  static Future<T> makeDioRequest<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } catch (rawException) {
      final processedException =
          NetworkExceptions.processDioError(rawException);
      throw processedException!;
    }
  }
}
