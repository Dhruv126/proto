import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:proto/constants/constants.dart';

class LoadingOverlayService {
  void show({bool dark = false}) {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..indicatorColor = Colors.transparent
      ..progressColor = Colors.transparent
      ..textColor = Colors.transparent;

    final opacity = 0.8;
    final maskColor = dark
        ? AppColors.appBlue.withOpacity(opacity)
        : AppColors.appWhite.withOpacity(opacity);

    EasyLoading.instance.maskColor = maskColor;
    EasyLoading.show(
        maskType: EasyLoadingMaskType.custom,
        indicator: CircularProgressIndicator(
          color: AppColors.appBlue,
          strokeWidth: 2,
        ));
  }

  void hide() {
    EasyLoading.dismiss();
  }
}

class LoadingWithGet {
  static show(){
    FocusScope.of(Get.context!).unfocus();
    return Get.context!.loaderOverlay.show(widgetBuilder: (progress) => CircularProgressIndicator(),);
  }

  static hide(){
    FocusScope.of(Get.context!).unfocus();
    return Get.context!.loaderOverlay.hide();
  }
}
