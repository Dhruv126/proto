import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proto/constants/colors.dart';

class ProtoScreenLayout extends StatelessWidget {
  final Widget body;
  final Widget? actionWidget;
  final Widget? titleWidget;
  final bool centerTitle;
  final bool needBackButton;
  final bool needCustomBackButton;
  final String text;
  final bool needCustomPadding;
  final double? horizontalPadding;
  final double? verticalPadding;
  final VoidCallback? onBackButtonPressed;
  final IconData? customBackButtonIcon;
  final Color customBackButtonColor;
  final bool needCustomAppBar;
  final PreferredSizeWidget? customAppBar;
  final bool needSingleChildScrollView;
  final bool layoutWithAppBar;
  final Color? scaffoldColor;
  final Widget? bottomSheetWidget;
  final bool setBottomInsetValue;
  final Widget? floatingActionButton;
  final Widget? bottomNBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  ProtoScreenLayout(
      {Key? key,
      required this.body,
      this.titleWidget,
      this.actionWidget,
      this.centerTitle = true,
      this.needBackButton = false,
      this.needCustomBackButton = false,
      this.text = '',
      this.needCustomPadding = true,
      this.horizontalPadding,
      this.verticalPadding,
      this.onBackButtonPressed,
      this.customBackButtonIcon,
      this.customBackButtonColor = AppColors.appWhite,
      this.needCustomAppBar = false,
      this.customAppBar,
      this.needSingleChildScrollView = true,
      this.scaffoldColor,
      this.bottomSheetWidget,
      this.setBottomInsetValue = true,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNBar,
      this.layoutWithAppBar = true})
      : super(key: key);
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottomSheetWidget,
      backgroundColor: scaffoldColor ?? AppColors.appWhite,
      resizeToAvoidBottomInset: setBottomInsetValue,
      appBar: layoutWithAppBar
          ? needCustomAppBar
              ? customAppBar
              : AppBar(
                  leading: needCustomBackButton
                      ? IconButton(
                          icon: Icon(
                            customBackButtonIcon,
                            color: customBackButtonColor,
                          ),
                          onPressed: onBackButtonPressed ??
                              () {
                                _key.currentState!.openDrawer();
                              },
                        )
                      : null,
                  automaticallyImplyLeading: needBackButton,
                  // iconTheme: IconThemeData(color: AppColors.textBlackShare),
                  elevation: 0,
                  backgroundColor: AppColors.appWhite,
                  title: titleWidget,
                  centerTitle: centerTitle,
                  actions: [
                    actionWidget ?? SizedBox(),
                    SizedBox(height: 20.h, width: 18.w)
                  ],
                )
          : null,
      bottomNavigationBar: bottomNBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: needSingleChildScrollView
          ? SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: needCustomPadding
                      ? EdgeInsets.symmetric(
                          horizontal: horizontalPadding ?? 15.w,
                          vertical: verticalPadding ?? 15.h)
                      : EdgeInsets.zero,
                  child: body,
                ),
              ),
            )
          : SafeArea(
              child: Padding(
                padding: needCustomPadding
                    ? EdgeInsets.symmetric(
                        horizontal: horizontalPadding ?? 15.w,
                        vertical: verticalPadding ?? 15.h)
                    : EdgeInsets.zero,
                child: body,
              ),
            ),
    );
  }
}
