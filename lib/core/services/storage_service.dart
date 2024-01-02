import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStoreKeys {
  // static const String userName = 'userName';
}

class SecureStore {
  final _store = const FlutterSecureStorage();

  Future<String?> read(String key) {
    return _store.read(key: key);
  }

  Future<void> write(String key, String? value) {
    return _store.write(key: key, value: value);
  }

  Future<bool> readBoolean(String key) async {
    String? value = await _store.read(key: key);
    return value == "true";
  }

  Future<void> writeBoolean(String key, bool value) {
    return _store.write(key: key, value: value.toString());
  }

  Future<bool> containsKey(String key) {
    return _store.containsKey(key: key);
  }

  Future<void> delete(String key) {
    return _store.delete(key: key);
  }

  Future<void> deleteAll() {
    return _store.deleteAll();
  }
}
