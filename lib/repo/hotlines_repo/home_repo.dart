import 'package:proto/core/services/api_service/api_service.dart';
import 'package:proto/core/services/api_service/hotlines_api/base_api_helper.dart';
import 'package:proto/model/response_item.dart';

class CountriesRepoHotLines {
  Future<ResponseItem> getCountries() async {
    bool status = false;
    ResponseItem result;
    dynamic data;

    String message = "";

    String requestUrl = EndPoints.countries;
    result = await BaseApiHelper.getRequest(Uri.parse(requestUrl), true);

    status = result.status;

    data = result.data;
    message = result.message;

    return ResponseItem(data: data, message: message, status: status);
  }
}
