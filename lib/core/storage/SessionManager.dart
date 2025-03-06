import 'package:elmer/core/constants/constants.dart';
// import 'package:elmer/features/authentication/data/dao/TokenResponse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String CLIENT_TOKEN = "client_token";
const String CLIENT_TOKEN_TYPE = "token_bearer";
const String AUTH_TOKEN = "auth_token";

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  static SessionManager get instance => _instance;

  SharedPreferences? sharedPreferences;

  factory SessionManager() {
    return _instance;
  }

  SessionManager._internal();

  String get clientToken => (sharedPreferences?.getString(CLIENT_TOKEN) ?? "");

  String get clientTokenType =>
      (sharedPreferences?.getString(CLIENT_TOKEN_TYPE) ?? "");

  set clientToken(String value) {
    sharedPreferences?.setString(CLIENT_TOKEN, value);
  }

  set clientTokenType(String value) {
    sharedPreferences?.setString(CLIENT_TOKEN_TYPE, value);
  }

  setString(String value, String key) {
    sharedPreferences?.setString(key, value);
  }

  set2FAString(String value, String key) {
    sharedPreferences?.setString(key, value);
  }

  setInt(int value, String key) {
    sharedPreferences?.setInt(key, value);
  }

  int? getLoanId(String key) {
    return sharedPreferences?.getInt(key);
  }

  int getInt(String key) {
    return sharedPreferences?.getInt(key) ?? 0;
  }

  String getString(String key) {
    return sharedPreferences?.getString(key) ?? "";
  }

  String get2FAString(String key) {
    return sharedPreferences?.getString(key) ?? "";
  }

  setBoolean(bool value, String key) {
    sharedPreferences?.setBool(key, value);
  }

  bool getBoolean(String key) {
    return sharedPreferences?.getBool(key) ?? false;
  }

  Future<bool?> removeString(String key) async {
    bool? response = await sharedPreferences?.remove(key);
    return response;
  }

  void setStringList(String key, List<String> value) {
    sharedPreferences?.setStringList(key, value);
  }

  List<String> getStringList(String key) {
    return sharedPreferences?.getStringList(key) ?? [];
  }

  Future<bool?> clearData() async {
    bool? response = await sharedPreferences?.clear();
    return response;
  }

  removeData() async {
    for (String? key in (sharedPreferences?.getKeys() ?? <dynamic>{})) {
      if (key != Constant.userName &&
          key != Constant.keyReferralCode &&
          key != Constant.keyReferralAmount &&
          key != Constant.keyReferrspaceAppAndC &&
          key != Constant.userName &&
          key != Constant.isFingerPrintEnabled &&
          key != Constant.isFingerPrintDialogShow &&
          key != Constant.showWiseDialog &&
          key != Constant.dontShowAgain) {
        await sharedPreferences?.remove(key ?? "");
      }
    }
  }

  removeSpecifiedData() async {
    for (String key in sharedPreferences?.getKeys() ?? <dynamic>{}) {
      if (key == "loanAmount" ||
          key == "prefferedDate" ||
          key == "personalContribution" ||
          key == "principalRepaymentFrequency" ||
          key == "interestRepaymentFrequency" ||
          key == "principalRepaymentFrequencyShortCode" ||
          key == "interestRepaymentFrequencyShortCode" ||
          key == "tenor") {
        await sharedPreferences?.remove(key);
      }
    }
  }

  // void saveLoginToken(TokenResponse clientTokenModel, {String? username}) {
  //   if (clientTokenModel.expiresIn == null) {
  //     throw 'expiresIn is null';
  //   }
  //   // Because shared Prefs is not storing the full access token because it is too long
  //   // then we have split it
  //   final parts = clientTokenModel.accessToken?.split('.');

  //   SessionManager.instance
  //       .setString(clientTokenModel.refreshToken ?? "", Constant.REFRESHTOKEN);
  //   SessionManager.instance
  //       .setString(clientTokenModel.tokenType ?? "", Constant.REFRESHTOKENTYPE);

  //   SessionManager.instance
  //       .setInt(clientTokenModel.expiresIn!, Constant.REFRESHTOKENTMODELEXP);

  //   SessionManager.instance
  //       .setString(parts?[0] ?? "", Constant.accessTokenPart1);
  //   SessionManager.instance
  //       .setString(parts?[1] ?? "", Constant.accessTokenPart2);
  //   SessionManager.instance
  //       .setString(parts?[2] ?? "", Constant.accessTokenPart3);
  // }
}

class SecureStorage {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static SecureStorage? _instance;

  factory SecureStorage() {
    return _instance ??= SecureStorage._internal();
  }

  SecureStorage._internal();

  static getValueByKey(String key) async {
    String? value = await storage?.read(key: key);
    return value ?? "";
  }

  static deleteByKey(String key) async {
    await storage?.delete(key: key);
  }

  static deleteAll() async {
    await storage?.deleteAll();
  }

  static setValue(String key, String value) async {
    await storage?.write(key: key, value: value);
  }

// Read all values
//Map<String, String> allValues = await storage.readAll();

// Delete all

// Write value
}
