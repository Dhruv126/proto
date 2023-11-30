import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proto/constants/constants.dart';
import 'package:proto/ui/src/extension/extension.dart';
import 'package:proto/ui/src/widgets/proto_button.dart';
import 'package:proto/ui/src/widgets/proto_sceen_layout.dart';
import 'package:proto/ui/src/widgets/proto_text_field.dart';
import 'package:proto/viewModel/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginViewModel loginViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return ProtoScreenLayout(
      layoutWithAppBar: false,
      setBottomInsetValue: false,
      body: GetBuilder<LoginViewModel>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            50.h.H(),
            Image.asset(AppImages.logo),
            20.h.H(),
            AuthStrings.email.appCommonText(),
            5.h.H(),
            ProtoTextField(
                controller: controller.emailController,
                needFormatter: true,
                textInputFormatters: [
                  FilteringTextInputFormatter.deny(new RegExp(r"\s\b|\b\s"))
                ],
                inputType: TextInputType.emailAddress,
                hintText: AuthStrings.email_hint),
            25.h.H(),
            AuthStrings.password.appCommonText(),
            5.h.H(),
            ProtoTextField(
                controller: controller.passwordController,
                hintText: AuthStrings.password_hint,
                isPasswordField: true),
            20.h.H(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AuthStrings.not_have_account.appLightText(size: 12),
                5.w.W(),
                InkResponse(
                  onTap: loginViewModel.navigateToSignupScreen,
                  child: AppStrings.sign_up
                      .appCommonText(size: 12, color: AppColors.appBlue),
                ),
                20.w.W()
              ],
            ),
            30.h.H(),
            ProtoButton(
              onPressed: controller.login,
              text: AppStrings.login,
            ),
          ],
        );
      }),
    );
  }
}
