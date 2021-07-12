import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class _Keys{
  static const baererToken = 'baererToken';
}
class AuthDataProvider{
  static const _secureStorage = FlutterSecureStorage();

  Future<String?> getBaererToken()  => _secureStorage.read(key: _Keys.baererToken);
  Future<void> setBaererToken(String? value) {
    if (value != null)
      return _secureStorage.write(key: _Keys.baererToken, value: value);
    else
      return _secureStorage.delete(key: _Keys.baererToken);
  }

}