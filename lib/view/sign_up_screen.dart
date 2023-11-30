import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proto/constants/constants.dart';
import 'package:proto/ui/src/extension/extension.dart';
import 'package:proto/ui/src/widgets/proto_button.dart';
import 'package:proto/ui/src/widgets/proto_sceen_layout.dart';
import 'package:proto/ui/src/widgets/proto_text_field.dart';
import 'package:proto/viewModel/signup_viewModel.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final SignupViewModel signupViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return ProtoScreenLayout(
      layoutWithAppBar: false,
      setBottomInsetValue: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(AppImages.logo, height: 100.h, width: 100.h)),
          20.h.H(),
          AuthStrings.user_name.appCommonText(),
          5.h.H(),
          ProtoTextField(
              controller: signupViewModel.nameController,
              hintText: AuthStrings.user_name_hint),
          25.h.H(),
          AuthStrings.email.appCommonText(),
          5.h.H(),
          ProtoTextField(
              controller: signupViewModel.emailController,
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
              controller: signupViewModel.passwordController,
              hintText: AuthStrings.password_hint,
              isPasswordField: true),
          25.h.H(),
          AuthStrings.confirm_password.appCommonText(),
          5.h.H(),
          ProtoTextField(
              controller: signupViewModel.confirmPasswordController,
              hintText: AuthStrings.confirm_password_hint,
              isPasswordField: true),
          20.h.H(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AuthStrings.already_account.appLightText(size: 12),
              5.w.W(),
              InkResponse(
                onTap: signupViewModel.navigateToLoginScreen,
                child: AppStrings.login
                    .appCommonText(size: 12, color: AppColors.appBlue),
              ),
              20.w.W()
            ],
          ),
          30.h.H(),
          ProtoButton(
            onPressed: signupViewModel.signUp,
            text: AppStrings.sign_up,
          ),
        ],
      ),
    );
  }
}
