import 'package:json_annotation/json_annotation.dart';

part 'app_dio_error_model.g.dart';

@JsonSerializable()
class AppDioError {
  final String? Message;

  AppDioError(this.Message);

  Map<String, dynamic> toJson() => _$AppDioErrorToJson(this);

  factory AppDioError.fromJson(Map<String, dynamic> json) =>
      _$AppDioErrorFromJson(json);
}
