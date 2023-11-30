import 'package:flutter/material.dart';
import 'package:proto/constants/colors.dart';

extension AddText on String {
  Widget appCommonText(
      {Color color = AppColors.appBlack,
      num size = 16,
      double letterSpacing = 0,
      TextAlign? align,
      FontWeight weight = FontWeight.w500,
      TextDecoration? decoration,
      FontStyle fontStyle = FontStyle.normal,
      int? maxLine,
      TextOverflow? overflow}) {
    return Text(
      this,
      style: defaultTextStyle(
          color: color, size: size, weight: weight, decoration: decoration),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLine,
    );
  }

  Widget appLightText(
      {Color color = AppColors.appBlack,
      num size = 16,
      FontWeight weight = FontWeight.w400,
      TextDecoration? decoration,
      TextAlign? align,
      int? maxLine,
      TextOverflow? overflow}) {
    return Text(
      this,
      style: lightTextStyle(
          color: color, size: size, weight: weight, decoration: decoration),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLine,
    );
  }

  TextStyle defaultTextStyle(
      {Color color = AppColors.appBlack,
      num size = 16,
      FontWeight weight = FontWeight.normal,
      TextDecoration? decoration}) {
    return TextStyle(
        fontWeight: FontWeight.w500,
        color: color,
        fontSize: size.toDouble(),
        decoration: decoration);
  }

  TextStyle lightTextStyle(
      {Color color = AppColors.appBlack,
      num size = 14,
      FontWeight weight = FontWeight.normal,
      TextDecoration? decoration}) {
    return TextStyle(
        fontWeight: FontWeight.w400,
        color: color,
        fontSize: size.toDouble(),
        decoration: decoration);
  }
}
