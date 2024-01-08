import 'package:proto/core/services/api_service/dio_api/client.dart';
import 'package:proto/core/services/api_service/dio_api/utils/network.dart';
import 'package:proto/model/countries_model.dart';

import 'base_repo.dart';

abstract class CountriesRepoRetro {
  Future<CountriesResponseModel> countries();
}

class CountriesRepoRetroImpl extends BaseRepository
    implements CountriesRepoRetro {
  CountriesRepoRetroImpl(ApiClient apiClient)
      : super(
          apiClient,
        );

  @override
  Future<CountriesResponseModel> countries() async {
    request() => apiClient.countries();
    var response = NetworkUtils.makeDioRequest(request);
    return response;
  }
}
