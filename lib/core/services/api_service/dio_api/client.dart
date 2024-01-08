import 'package:dio/dio.dart';
import 'package:proto/model/countries_model.dart';
import 'package:retrofit/retrofit.dart';

part 'client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    required String baseUrl,
  }) = _ApiClient;

  // var value = _result.data!
  //     .map((dynamic i) => GetEmployeesForBusinessResponseModel.fromJson(
  //     i as Map<String, dynamic>))
  //     .toList();

  @Header("content-type: application/json")
  @GET('countries')
  Future<CountriesResponseModel> countries();
}
