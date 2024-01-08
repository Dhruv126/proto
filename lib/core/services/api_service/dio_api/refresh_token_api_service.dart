// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:sauced_it/controller/payroll_controller.dart';
// import 'package:sauced_it/core/config/environment_helper.dart';
// import 'package:sauced_it/core/data/dao/user_dao.dart';
// import 'package:sauced_it/core/di/locator.dart';
// import 'package:sauced_it/core/services/api/utils/network.dart';
// import 'package:sauced_it/core/services/storage/secure_storage_service.dart';
// import 'package:sauced_it/res/res.dart';
//
// import 'refresh_token_client.dart';
//
// class RefreshTokenApiService {
//   static Dio _dio = Dio();
//   PayrollController payrollController = Get.put(PayrollController());
//
//   RefreshTokenApiClient clientApi = RefreshTokenApiClient(_dio,
//       baseUrl: locator<EnvironmentHelper>().getValue(EnvironmentKey.BaseUrl)!);
//   RefreshTokenApiService() {
//     _dio.options.contentType = Headers.jsonContentType;
//     _dio.options.headers["APIKey"] = Strings.apiKey;
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           String? refreshToken =
//               await locator<SecureStore>().read(SecureStoreKeys.refreshToken);
//           options.headers["Authorization"] = "Bearer $refreshToken";
//           handler.next(options);
//         },
//       ),
//     );
//   }
//
//   Future<bool> refreshToken() async {
//     String? userId = await locator<SecureStore>().read(SecureStoreKeys.userId);
//     print(userId);
//     try {
//       var request = () => clientApi.refreshToken(int.parse(userId!));
//       var response = await NetworkUtils.makeDioRequest(request);
//       locator<UserDao>()
//           .updateBearerToken(response.bearerToken!, int.parse(userId!));
//       locator<SecureStore>()
//           .write(SecureStoreKeys.bearerToken, response.bearerToken);
//       List<String> userRoles = await response.rolesAssignedToUser!;
//       if (userRoles.length > 1) {
//         locator<SecureStore>()
//             .writeBoolean(Strings.isEmployeeAndEmployer, true);
//       } else {
//         locator<SecureStore>()
//             .writeBoolean(Strings.isEmployeeAndEmployer, false);
//       }
//       payrollController.hasMultipleUserRoleCheck(await locator<SecureStore>()
//           .readBoolean(Strings.isEmployeeAndEmployer));
//       locator<SecureStore>().writeBoolean(SecureStoreKeys.isKeyPayConnected,
//           response.isKeyPayConnected ?? false);
//       payrollController.keyPayConnection(await locator<SecureStore>()
//           .readBoolean(SecureStoreKeys.isKeyPayConnected));
//       locator<SecureStore>().writeBoolean(SecureStoreKeys.manualLocationsOn,
//           response.manualLocationsOn ?? false);
//       payrollController.manualLocationsOnCheck(await locator<SecureStore>()
//           .readBoolean(SecureStoreKeys.manualLocationsOn));
//       locator<SecureStore>().writeBoolean(SecureStoreKeys.enableWorkZoneClockOn,
//           response.enableWorkZoneClockOn ?? true);
//       payrollController.enableWorkZoneClockOnCheck(await locator<SecureStore>()
//           .readBoolean(SecureStoreKeys.enableWorkZoneClockOn));
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
// }
