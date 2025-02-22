import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  writeSecureData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  readSecureData(String key) async {
    String value = await secureStorage.read(key: key) ?? 'No data found';
    return value;
  }
}
