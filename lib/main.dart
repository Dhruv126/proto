import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:proto/firebase_options.dart';
import 'package:proto/services/navigation_service.dart';
import 'package:proto/services/route_service.dart';
import 'package:proto/viewModel/binding_viewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
              initialRoute: AppRoutes.loginScreen,
              initialBinding: BaseBinding(),
              navigatorKey: NavigationService.navigatorKey,
              onGenerateRoute: (settings) =>
                  OnGenerateRoutes.generateRoute(settings),
              debugShowCheckedModeBanner: false);
        });
  }
}
