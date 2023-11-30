import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:proto/constants/constants.dart';
import 'package:proto/ui/src/extension/extension.dart';

import 'model/app_dio_error_model.dart';

class NetworkExceptions {
  static Exception? processDioError(error) {
    if (error is Exception) {
      try {
        var exception;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.connectionError:
              exception = NoInternetException();
              break;
            case DioExceptionType.badResponse:
              String? errorMessage = "";
              if (error.response?.data == null) {
                errorMessage = error.response?.statusMessage ?? "";
              } else if (error.response?.statusCode == 403) {
                errorMessage = error.response?.statusMessage;
              } else {
                if (!(error.response?.data is String)) {
                  errorMessage = error.response?.data["Message"];
                } else {
                  AppDioError appDioError = AppDioError.fromJson(
                      jsonDecode(error.response!.data.toString()));
                  if (appDioError.Message.isNullOrEmpty())
                    errorMessage = error.response?.statusMessage ?? "";
                  else
                    errorMessage = appDioError.Message;
                }
              }
              exception =
                  NetworkException(errorMessage, error.response?.statusCode);
              break;
            default:
              exception = UnexpectedErrorException();
              break;
          }
          return exception;
        }
      } catch (e) {
        return UnexpectedErrorException(e);
      }
    }
    return null;
  }
}

class UnexpectedErrorException extends NetworkException {
  final message = ErrorStrings.serverError;
  final Object? error;

  const UnexpectedErrorException([this.error]);
}

class NoInternetException extends NetworkException {
  final message = ErrorStrings.noInternetConnection;

  const NoInternetException();
}

class NetworkException implements Exception {
  final int? statusCode;
  final String? message;

  const NetworkException([this.message = '', this.statusCode]);
}
