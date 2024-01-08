import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:proto/core/services/api_service/api_service.dart';

enum apiType { aPost, aGet, aPut }

class APIService {
  var response;
  // String baseUrl = EndPoints.baseUrl;
  // var request;

  Future fetchApi(
      {required String url,
      required apiType type,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool fileUpload = false}) async {
    Map<String, String>
        headers = /*GetStorageServices.getBarrierToken() != null
        ? {
      'Authorization': 'Bearer ${GetStorageServices.getBarrierToken()}',
      'Content-Type': 'application/json'
    }
        : */
        {
      // 'Content-Type': 'application/json',
      'X-BLOBR-KEY': 'MtlFUPk9gpLyz3AOUNpHNveJHe1Usbm8',
    };

    // print("Bearer ${GetStorageServices.getBarrierToken()}");

    try {
      if (type == apiType.aGet) {
        final result = await http.get(Uri.parse(url), headers: headers);
        response = returnResponse(result.statusCode, result.body);
        log("RES status code ${result.statusCode}");
        log("res${result.body}");
      } else /*if (apiType == apiType.aPost)*/ {
        print("REQUEST PARAMETER url  $url");
        print("REQUEST PARAMETER $body");

        final result = await http.post(Uri.parse(url),
            body: json.encode(body), headers: headers);
        print("resp${result.body}");
        response = returnResponse(result.statusCode, result.body);
        print(result.statusCode);
      }
      /*else {
        print("REQUEST PARAMETER url  $url");
        print("REQUEST PARAMETER $body");

        final request =
            await http.MultipartRequest("PUT", Uri.parse(baseUrl + url));

        request.headers.addAll(headers);

        request.fields["name"] = body!["name"];
        request.fields["height"] = body["height"];
        request.files.add(await http.MultipartFile.fromPath(
            "userImage", body["userImage"],
            contentType: MediaType('userImage', 'jpg')));
        request.fields["age"] = body["age"];
        request.fields["weight"] = body["weight"];

        var result = await request.send();
        String res = await result.stream.transform(utf8.decoder).join();

        // print("resp${result.body}");
        response = returnResponse(result.statusCode, res);
        // print(result.statusCode);
      }*/
    } on SocketException {
      throw FetchDataException('No Internet access');
    }

    return response;
  }

  Future getPutResponse(
      {required String url,
      required apiType type,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool fileUpload = false}) async {
    Map<String, String>
        headers = /*GetStorageServices.getBarrierToken() != null
        ? {
      'Authorization': 'Bearer ${GetStorageServices.getBarrierToken()}',
      'Content-Type': 'application/json'
    }
        :*/
        {'Content-Type': 'application/json'};
    try {
      print("REQUEST PARAMETER url  $url");
      print("REQUEST PARAMETER $body");

      final request = await http.MultipartRequest("PUT", Uri.parse(url));

      request.headers.addAll(headers);

      request.fields["name"] = body!["name"];
      request.fields["height"] = body["height"];
      if (body["userImage"] != null && body["userImage"] != "") {
        request.files.add(await http.MultipartFile.fromPath(
            "userImage", body["userImage"],
            contentType: MediaType('userImage', 'jpg')));
      }
      request.fields["age"] = body["age"];
      request.fields["weight"] = body["weight"];

      var result = await request.send();
      String res = await result.stream.transform(utf8.decoder).join();

      // print("resp${result.body}");
      response = returnResponse(result.statusCode, res);
      // print(result.statusCode);
    } on SocketException {
      throw FetchDataException('No Internet access');
    }

    return response;
  }

  Future getMultipartRequest(
      {required String url,
      required apiType type,
      Map<String, dynamic>? body,
      Map<String, String>? header,
      bool fileUpload = false}) async {
    Map<String, String>
        headers = /*GetStorageServices.getBarrierToken() != null
        ? {
      'Authorization': 'Bearer ${GetStorageServices.getBarrierToken()}',
      'Content-Type': 'application/json'
    }
        :*/
        {'Content-Type': 'application/json'};
    try {
      print("REQUEST PARAMETER url  $url");
      print("REQUEST PARAMETER $body");

      final request = await http.MultipartRequest("POST", Uri.parse(url));

      request.headers.addAll(headers);

      request.fields["title"] = body!["title"];
      request.fields["description"] = body["description"];
      request.files.add(await http.MultipartFile.fromPath(
          "image", body["image"],
          contentType: MediaType('image', 'jpg')));
      request.fields["categoryId"] = body["categoryId"];

      var result = await request.send();
      String res = await result.stream.transform(utf8.decoder).join();

      // print("resp${result.body}");
      response = returnResponse(result.statusCode, res);
      // print(result.statusCode);
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
        // return jsonDecode(result);
        throw BadRequestException('Bad Request');
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
