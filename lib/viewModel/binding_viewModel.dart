import 'package:get/get.dart';
import 'package:proto/viewModel/chat_viewModel.dart';
import 'package:proto/viewModel/home_viewModel.dart';
import 'package:proto/viewModel/login_viewModel.dart';
import 'package:proto/viewModel/signup_viewModel.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel(), fenix: true);
    Get.lazyPut(() => SignupViewModel(), fenix: true);
    Get.lazyPut(() => HomeViewModel(), fenix: true);
    Get.lazyPut(() => ChatViewModel(), fenix: true);
  }
}
