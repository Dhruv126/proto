import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:proto/model/response_item.dart';

import 'api_exception.dart';
import 'constants.dart';

class BaseApiHelper {
  static Future<ResponseItem> getRequest(
      Uri requestUrl, bool passAuthToken) async {
    return await http
        .get(
          requestUrl,
          headers: requestAuthHeader(passAuthToken),
        )
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error, requestUrl));
  }

  static Future<ResponseItem> postRequest(String requestUrl,
      Map<String, dynamic> requestData, bool passAuthToken) async {
    return await http
        .post(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestAuthHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error, requestUrl));
  }

  static Future<ResponseItem> putRequest(String requestUrl,
      Map<String, dynamic> requestData, bool passAuthToken) async {
    return await http
        .put(Uri.parse(requestUrl),
            body: json.encode(requestData),
            headers: requestAuthHeader(passAuthToken))
        .then((response) => onValue(response))
        .onError((error, stackTrace) => onError(error, requestUrl));
  }

  static Future onValue(http.Response response) async {
    ResponseItem result;
    var responseData = jsonDecode(response.body.toString());
    bool status = false;
    String? message;
    var data = responseData;

    if (response.statusCode == 200 || response.statusCode == 201) {
      message = "Ok";
      status = true;
      data = responseData;
    } else {
      message = "Something went wrong.";
    }
    result = ResponseItem(data: data, message: message, status: status);
    log("response: ${response.body}");
    return result;
  }

  static onError(error, url) {
    bool status = false;
    String message = "Unsuccessful request";
    if (error is SocketException) {
      message = ResponseException("No internet connection").toString();
    } else if (error is FormatException) {
      message = ResponseException("Something wrong in response.").toString() +
          error.toString();
    }
    return ResponseItem(data: null, message: message, status: status);
  }
}
