import 'dart:async';

import 'package:proto/core/services/api_service/dio_api/exception/network_exceptions.dart';

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
