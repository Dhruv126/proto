import 'package:proto/model/countries_model.dart';
import 'package:proto/services/api_service/api_endpoints.dart';
import 'package:proto/services/api_service/base_services.dart';

class CountriesRepo {
  static Future<CountiresResponseModel> walletSyncRepo(String qrData) async {
    var response = await APIService().getResponse(
      url: EndPoints.countries,
      apiType: APIType.aGet,
    );
    CountiresResponseModel walletSyncResponseModel =
        CountiresResponseModel.fromJson(response);
    return walletSyncResponseModel;
  }
}
