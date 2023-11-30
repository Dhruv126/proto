import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proto/constants/constants.dart';
import 'package:proto/ui/src/extension/extension.dart';

class ProtoButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? buttonRadius;
  final double? width;
  final double? height;

  const ProtoButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.buttonRadius,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.h,
      width: width ?? MediaQuery.of(context).size.width.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColors.appBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonRadius ?? 5.r),
            ),
          ),
        ),
        onPressed: onPressed,
        child: text.appCommonText(color: textColor ?? AppColors.appWhite),
      ),
    );
  }
}
