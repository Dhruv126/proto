import 'package:proto/model/countries_model.dart';

import 'package:proto/core/services/services.dart';

class CountriesRepo {
  static Future<CountriesResponseModel> countriesRepo() async {
    var response = await APIService().fetchApi(
      url: EndPoints.countries,
      type: apiType.aGet,
    );
    CountriesResponseModel countriesResponseModel =
        CountriesResponseModel.fromJson(response);
    return countriesResponseModel;
  }
}
