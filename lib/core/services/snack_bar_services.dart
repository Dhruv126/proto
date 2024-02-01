import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proto/constants/constants.dart';
import 'package:proto/ui/src/extension/extension.dart';

class SnackBarService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void show(String text, {bool isError = false}) {
    final textWidget = Text(text, textAlign: TextAlign.center);
    final snackBarWidget = isError
        ? SnackBar(backgroundColor: AppColors.appBlue, content: textWidget)
        : SnackBar(backgroundColor: AppColors.appBlack, content: textWidget);

    scaffoldMessengerKey.currentState!.removeCurrentSnackBar();
    scaffoldMessengerKey.currentState!.showSnackBar(snackBarWidget);
  }

  void showError(String text) {
    show(text, isError: true);
  }

  void showGenericError() {
    showError('Something went wrong, please try again');
  }

  void hideCurrentSnackBar() {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }

  showAppSnackBar(String tittle, {bool status = false}) {
    return Get.showSnackbar(GetSnackBar(
      // message: tittle,
      messageText: tittle.appCommonText(
          size: 14,
          color: Theme.of(Get.context!).secondaryHeaderColor,
          align: TextAlign.start,
          weight: FontWeight.w600),
      // messageText: tittle.wallyText(fontSize: 24, fontWeight: wallyLightWeight, color: color),
      borderRadius: 15,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shouldIconPulse: false,
      icon: Icon(
        status ? Icons.check_circle_outline_rounded : Icons.error_outline,
        color: Theme.of(Get.context!).secondaryHeaderColor,
      ),
      backgroundColor: AppColors.appWhite,
      duration: const Duration(seconds: 3),
    ));
  }
}
