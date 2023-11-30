import 'package:get/get.dart';
import 'package:proto/core/services/services.dart';

class BaseViewModel extends GetxController {
  final NavigationService navigationService = NavigationService();
  final LoadingOverlayService _loadingOverlayService = LoadingOverlayService();

  void setGlobalBusy(bool value, {bool dark = false}) {
    if (value) {
      _loadingOverlayService.show();
    } else {
      _loadingOverlayService.hide();
    }
  }
}
