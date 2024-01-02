// import 'package:dio/dio.dart';
// import 'package:proto/model/countries_model.dart';
// import 'package:retrofit/retrofit.dart';
//
// part '../client.g.dart';
//
//
// @RestApi()
// abstract class ApiClient {
//   factory ApiClient(
//       Dio dio, {
//         required String baseUrl,
//       }) = _ApiClient;
//
//   @Header("content-type: application/json")
//   @GET('countries')
//   Future<CountriesResponseModel> countries();
// }