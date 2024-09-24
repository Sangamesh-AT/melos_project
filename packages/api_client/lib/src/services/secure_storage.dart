import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ISecureStorage {
  bool isTokenExpired(String expiry);
  Future<void> write(String key, String value);
  Future<String?> read(String key);
  Future<void> delete(String key);
  Future<void> clear();
}

class SecureStorage implements ISecureStorage {
  static final _instance = SecureStorage._internal();

  factory SecureStorage() => _instance;

  SecureStorage._internal();

  final _secureStorage = const FlutterSecureStorage();

  @override
  bool isTokenExpired(String expiry) {
    final expiryDate = DateTime.parse(expiry);
    return expiryDate.isBefore(DateTime.now());
  }

  @override
  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
