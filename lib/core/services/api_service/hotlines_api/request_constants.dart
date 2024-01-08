class AppUrls {
  // ignore: constant_identifier_names
  static const String BASE_URL =
      "https://rajiv-cab-node5flyweis.vercel.app/api/v1/";
}

class MethodNames {
  static const userRegistration = "user/register";
  static const userLogin = "user/login";
  static const userOTPVerification = "user/verify/otp";
  static const userProfileByID = "user/me";
  static const userLocation = "user/location";
  static const userDetails = "user/detail/";
  static const chooseCar = "user/choose/car/";
  static const getCar = "vendor/available/get/car";
}

class RequestHeaderKey {
  static const contentType = "Content-Type";
  static const authorization = "Authorization";
}
