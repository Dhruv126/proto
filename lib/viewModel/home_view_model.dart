import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:proto/core/base_view_model.dart';
import 'package:proto/model/countries_model.dart';
import 'package:proto/repo/countries_repo.dart';

class HomeViewModel extends BaseViewModel {
  Rx<CountriesResponseModel> countriesResponse = CountriesResponseModel().obs;
  RxBool isLoading = false.obs;

  @override
  onInit() {
    getCountries();
    super.onInit();
  }

  getCountries () async {
    setGlobalBusy(true);
    try {
      countriesResponse.value = await CountriesRepo.countriesRepo();
      debugPrint("==== > $countriesResponse");
    } catch (e) {
      debugPrint("======= > $e");
    } finally {
      setGlobalBusy(false);
    }
    update();
  }
}
