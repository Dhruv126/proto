import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

enum APIType { aPost, aGet, aPut, aPatch }

class APIService {
  var response;

  Future getResponse(
      {required String url,
      required APIType apiType,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool isChat = false,
      bool fileUpload = false}) async {
    try {
      Map<String, String>? headers = !isChat
          ? {'X-BLOBR-KEY': 'urHc3tovtFPKy4to9Lvwit7sEbygFWFS'}
          : header;
      if (apiType == APIType.aGet) {
        log('--- GET URL---${url}');
        final result = await http.get(Uri.parse(url), headers: headers);
        response = returnResponse(result.statusCode, result.body);
      } else if (apiType == APIType.aPost) {
        log('--- POST URL---${url}');
        final result = await http.post(Uri.parse(url),
            body: !isChat ? json.encode(body) : body, headers: headers);
        response = returnResponse(result.statusCode, result.body);
        log('--- POST RESPONSE---${result.body}');
      } else if (apiType == APIType.aPut) {
        log('--- PUT URL---${url}');
        final result = await http.put(Uri.parse(url), headers: headers);
        response = returnResponse(result.statusCode, result.body);
      }
    } on SocketException {
      throw FetchDataException('No Internet access');
    }

    return response;
  }

  returnResponse(int status, String result) {
    switch (status) {
      case 200:
        return jsonDecode(result);
      case 201:
        return jsonDecode(result);
      case 400:
        return jsonDecode(result);
      case 401:
        throw UnauthorisedException('Unauthorised user');
      case 404:
        throw ServerException('Server Error');
      case 500:
      default:
        throw FetchDataException('Internal Server Error');
    }
  }
}
