// import 'dart:developer';
//
// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:sauced_it/modules/auth/login/model.dart';
//
// part 'refresh_token_client.g.dart';
//
// @RestApi()
// abstract class RefreshTokenApiClient {
//   factory RefreshTokenApiClient(
//     Dio dio, {
//     required String baseUrl,
//   }) = _RefreshTokenApiClient;
//
//   @POST('account/refresh-token/v3?userId={userId}')
//   Future<LoginResponse> refreshToken(@Path("userId") int userId);
// }
