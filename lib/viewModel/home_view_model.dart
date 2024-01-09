import 'package:flutter/cupertino.dart';
import 'package:proto/model/countries_model.dart';
import 'package:proto/model/response_item.dart';
import 'package:proto/repo/hotlines_repo/home_repo.dart';

// class HomeViewModel extends BaseViewModel {
//   Rx<CountriesResponseModel> countriesResponse = CountriesResponseModel().obs;
//   RxBool isLoading = false.obs;
//   // List<GetAllCarsModel> getAllCars = [];
//
//   @override
//   onInit() {
//     getCountriesHotlines();
//     super.onInit();
//   }
//
//   getCountries() async {
//     setGlobalBusy(true);
//     try {
//       countriesResponse.value = await CountriesRepo.countriesRepo();
//       debugPrint("==== > $countriesResponse");
//     } catch (e) {
//       debugPrint("======= > $e");
//     } finally {
//       setGlobalBusy(false);
//     }
//     update();
//   }
//
//   getCountriesHotlines() async {
//     setGlobalBusy(true);
//     ResponseItem result = ResponseItem(
//         data: null, message: "Something went wrong", status: false);
//     result = await CountriesRepoHotLines().getCountries();
//
//     try {
//       if (result.status) {
//         if (result.data != null) {
//           countriesResponse.value =
//               CountriesResponseModel.fromJson(result.data);
//
//           /// list model
//           // List<GetAllCarsModel> getAllCarsModelFromJson(String str) =>
//           //     List<GetAllCarsModel>.from(
//           //         json.decode(str).map((x) => GetAllCarsModel.fromJson(x)));
//           //
//           // String getAllCarsModelToJson(List<GetAllCarsModel> data) =>
//           //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//           /// store in var
//           // getAllCars = getAllCarsModelFromJson(json.encode(result.data));
//         }
//       } else {
//         // showAppSnackBar(result.message);
//       }
//     } catch (e) {
//       debugPrint("======= > $e");
//     } finally {
//       setGlobalBusy(false);
//     }
//     update();
//   }
//
//   Future<void> getCountriesRetro(
//       {bool needRefresh = false, bool checkPage = false}) async {
//     try {
//       // var response = await CountriesRepoRetroImpl().countries();
//       // countriesResponse.value = response;
//     } on NetworkException catch (e) {
//       // setError(e.message);
//     } finally {
//       setGlobalBusy(false);
//     }
//     update();
//   }
// }

class HomeViewModel extends ChangeNotifier {
  CountriesResponseModel? countriesResponse;
  bool isLoading = false;
  // List<GetAllCarsModel> getAllCars = [];

  Future<void> getCountriesHotlines() async {
    // setGlobalBusy(true);
    isLoading = true;
    ResponseItem result = ResponseItem(
        data: null, message: "Something went wrong", status: false);
    result = await CountriesRepoHotLines().getCountries();

    try {
      if (result.status) {
        if (result.data != null) {
          countriesResponse = CountriesResponseModel.fromJson(result.data);

          /// list model
          // List<GetAllCarsModel> getAllCarsModelFromJson(String str) =>
          //     List<GetAllCarsModel>.from(
          //         json.decode(str).map((x) => GetAllCarsModel.fromJson(x)));
          //
          // String getAllCarsModelToJson(List<GetAllCarsModel> data) =>
          //     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
          /// store in var
          // getAllCars = getAllCarsModelFromJson(json.encode(result.data));
        }
      } else {
        // showAppSnackBar(result.message);
      }
    } catch (e) {
      debugPrint("======= > $e");
    } finally {
      isLoading = false;
      // setGlobalBusy(false);
    }
    notifyListeners();
  }
}
