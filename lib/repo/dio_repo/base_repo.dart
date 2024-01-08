import 'package:proto/core/services/api_service/dio_api/client.dart';

abstract class BaseRepository {
  late ApiClient apiClient;
  // SecureStore? storage;

  BaseRepository(this.apiClient /*, {this.storage}*/) {
    apiClient = apiClient;
    // this.storage = storage;
  }
}
