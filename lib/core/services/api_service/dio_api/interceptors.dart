// import 'package:dio/dio.dart';
// import 'package:sauced_it/core/di/locator.dart';
// import 'package:sauced_it/core/services/api/api_service.dart';
// import 'package:sauced_it/core/services/api/refresh_token_api_service.dart';
// import 'package:sauced_it/core/services/snackbar_service.dart';
// import 'package:sauced_it/core/services/storage/secure_storage_service.dart';
// import 'package:sauced_it/res/res.dart';
// import 'package:sauced_it/utils/logout_function.dart';
// import 'package:sauced_it/utils/string_ext.dart';
//
// import '../../routing/routes.dart';
// import '../loading_overlay_service.dart';
// import '../navigation_service.dart';
//
// final _loadingOverlayService = locator<LoadingOverlayService>();
// final snackBarService = locator<SnackbarService>();
//
// final loggingInterceptor = InterceptorsWrapper(
//   onRequest: (options, handler) {
//     print('mobileApi: ${options.method} ${options.uri}');
//     print(options.data);
//     print(options.headers);
//     handler.next(options);
//   },
//   onResponse: (response, handler) async {
//     print('mobileApi: -> ${response.statusCode}');
//     print('mobileApi: -> ${response.data}');
//     handler.next(response);
//   },
//   onError: (error, handler) async {
//     String? userId = await locator<SecureStore>().read(SecureStoreKeys.userId);
//     String? token =
//         await locator<SecureStore>().read(SecureStoreKeys.bearerToken);
//     if (!token.isNullOrEmpty()) {
//       if (error.response?.statusCode == 401 &&
//           error.response?.statusMessage == Strings.invalidToken) {
//         if (await RefreshTokenApiService().refreshToken()) {
//           final retryResponse = await ApiService().retry(error.requestOptions);
//           handler.resolve(retryResponse);
//         } else {
//           if (userId != null) {
//             clearAllDataAndRedirectToLogin(int.parse(userId));
//             _loadingOverlayService.hide();
//           }
//         }
//         return;
//       } else if (error.response?.statusCode == 403) {
//         if (userId != null) {
//           clearAllDataAndRedirectToLogin(int.parse(userId));
//           locator<NavigationService>().navigateTo(Routes.subscriptionPage);
//           return;
//         }
//       }
//     }
//
//     snackBarService.showError("${error.response?.data}");
//     print('mobileApi: -> ${error.response?.statusCode}');
//     print('mobileApi: -> ${error.response?.data}');
//     handler.next(error);
//   },
// );
//
// final bearerTokenInterceptor = InterceptorsWrapper(
//   onRequest: (options, handler) async {
//     String? token =
//         await locator<SecureStore>().read(SecureStoreKeys.bearerToken);
//     options.headers["Authorization"] = "Bearer $token";
//     print(options.headers["Authorization"]);
//     handler.next(options);
//   },
// );
