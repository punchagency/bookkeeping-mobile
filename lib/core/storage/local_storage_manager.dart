import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorage {
  Future<void> saveSecureString({required String key, String? value});

  Future<void> saveString({required String key, required String value});

  Future<void> saveInt({required String key, required int value});

  Future<void> saveSecureInt({required String key, required int value});

  Future<void> saveBool({required String key, required bool value});

  Future<void> saveSecureBool({required String key, required bool value});

  Future<String?> getString({required String key});

  Future<String?> getSecureString({required String key});

  Future<int> getInt({required String key, int defaultValue = 0});

  Future<int> getSecureInt({required String key, int defaultValue = 0});

  Future<bool> getBool({required String key, bool defaultValue = false});

  Future<bool> getSecureBool({required String key, bool defaultValue = false});
}

class LocalStorageImpl extends LocalStorage {
  LocalStorageImpl({
    required this.secureStorage,
    required this.sharedPreferences,
  });

  final FlutterSecureStorage secureStorage;
  final SharedPreferences sharedPreferences;

  @override
  Future<void> saveBool({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> saveSecureBool(
      {required String key, required bool value}) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<void> saveInt({required String key, required int value}) async {
    await sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> saveSecureInt({required String key, required int value}) async {
    await secureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<void> saveString({required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  Future<void> saveSecureString({required String key, String? value}) async {
    await secureStorage.write(key: key, value: value);
  }

  @override
  Future<int> getInt({required String key, int defaultValue = 0}) async {
    var value = sharedPreferences.getInt(key);
    return value ?? defaultValue;
  }

  @override
  Future<int> getSecureInt({required String key, int defaultValue = 0}) async {
    var value = await secureStorage.read(key: key);
    return int.tryParse(value ?? '') ?? defaultValue;
  }

  @override
  Future<bool> getBool({required String key, bool defaultValue = false}) async {
    var value = sharedPreferences.getBool(key);
    return value ?? defaultValue;
  }

  @override
  Future<bool> getSecureBool({
    required String key,
    bool defaultValue = false,
  }) async {
    var value = await secureStorage.read(key: key);
    return bool.tryParse(value ?? '') ?? defaultValue;
  }

  @override
  Future<String?> getString({required String key}) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<String?> getSecureString({required String key}) async {
    return await secureStorage.read(key: key);
  }
}

class LocalStorageKeys {
  static const String accessToken = "access_token";

  static get refreshToken => "refresh_token";

  static get tokenType => "token_type";

  static get user => "user";

  static get password => 'password';

  static get accessTokenGrantType => "access_token_grant_type";

  static get accessTokenExpiresIn => "access_token_expires";

  static get accessTokenPart1 => "partone";

  static get accessTokenPart2 => "parttwo";

  static get accessTokenPart3 => "partthree";

  static get hasLoggedIn => "hasloggedin";

  static get username => "username";

  static get userId => "userId";

  static get bvn => "bvn";

  static get phoneNumber => "phoneNumber";

  static get verificationStatus => "verificationStatus";

  static get firstName => "firstName";
}
