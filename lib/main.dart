import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proto/core/di/repo_module.dart';
import 'package:proto/core/services/services.dart';
import 'package:proto/firebase_options.dart';
import 'package:proto/viewModel/binding_view_model.dart';
import 'package:proto/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
      ],
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
                initialRoute: AppRoutes.homeScreen,
                initialBinding: BaseBinding(),
                navigatorKey: NavigationService.navigatorKey,
                builder: EasyLoading.init(),
                onGenerateRoute: (settings) =>
                    OnGenerateRoutes.generateRoute(settings),
                debugShowCheckedModeBanner: false);
          }),
    );
  }
}
