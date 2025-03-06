// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class LoginNotifier extends ChangeNotifier with WithMixin {
  // final AuthRepository _repository;

  // LoginNotifier({
  //   required AuthRepository repository,
  // }) : _repository = repository;

  // final _localStorage = getIt<LocalStorage>();

  LoginStates loginStates = LoginStates.idle;
  setLoginStates(LoginStates state) {
    loginStates = state;
    notifyListeners();
  }

  Future<void> login(
    BuildContext context, {
    required String username,
    required String password,
  }) async {}

  // _saveToken({required String token}) async {
  //   await _localStorage.saveSecureString(
  //     key: LocalStorageKeys.accessToken,
  //     value: token,
  //   );
  // }

  // _saveRefreshToken({required String refreshToken}) async {
  //   await _localStorage.saveSecureString(
  //     key: LocalStorageKeys.refreshToken,
  //     value: refreshToken,
  //   );
  // }
}

mixin WithMixin on ChangeNotifier {
  handleFailure(BuildContext context, String? message) {
    String? errorString = message;
    // CommonPopup.showError(context, title: "Error", message: errorString);
    
  }

  // handleLoginResponse(BuildContext context, LoginResponse response) {
  //   switch (response.responseCode) {
  //     case "05":
  //       // Device Change

  //       break;
  //     default:
  //       handleFailure(context, response.responseMessage);
  //   }
  // }
}

enum WithStates {
  loading,
  success,
  error,
  idle;

  bool get isLoading => this == WithStates.loading;

  bool get isSuccess => this == WithStates.success;

  bool get isError => this == WithStates.error;

  bool get isIdle => this == WithStates.idle;
}

enum LoginStates {
  loading,
  success,
  error,
  idle;

  bool get isLoading => this == LoginStates.loading;

  bool get isSuccess => this == LoginStates.success;

  bool get isError => this == LoginStates.error;

  bool get isIdle => this == LoginStates.idle;
}
