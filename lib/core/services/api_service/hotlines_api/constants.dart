// import 'package:flutter/material.dart';
// import 'package:hotlines/extras/request_constants.dart';
//
// import '../constant/shred_preference.dart';
//
// Map<String, String> requestHeader() {
//   return {
//     'X-RapidAPI-Key': '08caae6c2bmsh572aebe4b01a829p14475ejsn8e6b0956f735',
//     'X-RapidAPI-Host': 'sportspage-feeds.p.rapidapi.com'
//   };
// }
//

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const authorization = "Authorization";
}

Map<String, String> requestAuthHeader(bool passAuthToken) {
  return {
    RequestHeaderKey.contentType: "application/json",
    // if (passAuthToken)
    // RequestHeaderKey.authorization:
    //     '${Storage.readBoolean(StorageKeys.isLoggedIn) == true ? "Bearer ${Storage.read(StorageKeys.token)}" : ''}',
  };
}
