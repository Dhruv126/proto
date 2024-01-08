import 'package:dio/dio.dart';
import 'package:proto/core/services/api_service/api_endpoints.dart';

import 'client.dart';

class ApiService {
  static final Dio _dio = Dio();
  ApiClient client = ApiClient(_dio, baseUrl: EndPoints.baseUrl);
  ApiService() {
    // _dio.interceptors.addAll([loggingInterceptor, bearerTokenInterceptor]);
    _dio.options.contentType = Headers.jsonContentType;
    // _dio.options.headers["APIKey"] = Strings.apiKey;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    // String? updatedBearerToken =
    //     await locator<SecureStore>().read(SecureStoreKeys.bearerToken);
    // print("Updated Token: $updatedBearerToken");
    _dio.interceptors.clear();
    // _dio.interceptors.addAll([loggingInterceptor, bearerTokenInterceptor]);
    final opts = Options(method: requestOptions.method);
    return _dio.request<dynamic>(
      // locator<EnvironmentHelper>().getValue(EnvironmentKey.BaseUrl)! +
      EndPoints.baseUrl + requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: opts,
    );
  }
}
