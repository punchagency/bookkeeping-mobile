// ignore: file_names

import 'package:elmer/core/constants/path.dart';

import 'package:elmer/core/networkhandler/failure.dart';
import 'package:elmer/core/storage/local_storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// ignore: file_names
import 'dart:async';

class NetworkRequester {
  NetworkRequester(
    this.localStorage, {
    required this.dio,
  }) {
    _setupInterceptors();
  }

  final Dio dio;
  final LocalStorage localStorage;

  final String? channel = dotenv.env['channel'];
  final String? clientId = dotenv.env['clientId'];

  String _token = '';

  set token(String token) {
    _token = token;
  }

  void clearSession() {
    // clears token
    _token = '';
  }

  void _setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          if (e.response?.statusCode == 401 && await _refreshToken()) {
            _retryRequest(e.requestOptions, handler);
          } else {
            handler.next(e);
          }
        },
      ),
    );
  }

  Future<void> _retryRequest(
      RequestOptions options, ErrorInterceptorHandler handler) async {
    try {
      final token =
          await localStorage.getSecureString(key: LocalStorageKeys.accessToken);
      options.headers['Authorization'] = 'Bearer $token';

      final response = await dio.request(
        options.path,
        options: Options(
          method: options.method,
          headers: options.headers,
          contentType: options.contentType,
        ),
        data: options.data,
        queryParameters: options.queryParameters,
      );
      handler.resolve(response);
    } on DioException catch (error) {
      handler.reject(error);
    }
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await localStorage.getSecureString(
          key: LocalStorageKeys.refreshToken);
      final userId =
          await localStorage.getSecureString(key: LocalStorageKeys.userId);
      final baseUrlAuth = dotenv.env['baseUrlAuth'];

      final payload = {
        "refreshToken": refreshToken,
        "userId": userId,
      };

      // Call API to refresh token

      //TODO 1
      final response = await dio.post(
        '$baseUrlAuth${Paths.login}',
        data: payload,
        options: Options(
          method: 'POST',
          headers: await getHeaders(false),
        ),
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      // Save new tokens
      await localStorage.saveSecureString(
          key: LocalStorageKeys.accessToken, value: newAccessToken);
      await localStorage.saveSecureString(
          key: LocalStorageKeys.refreshToken, value: newRefreshToken);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Response<Map<String, dynamic>>> get(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isProtected = false,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    String? path,
    String? contentType,
  }) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        queryParameters: queryParameters ?? {},
        options: Options(
          method: 'GET',
          headers: headers,
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } on DioException catch (e) {
      throw ExceptionHandler.errorResponseData(e);
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response<List<dynamic>>> getList(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    bool isProtected = false,
    Map<String, dynamic>? headers,
    bool isFormData = false,
    String? path,
    String? contentType,
  }) async {
    try {
      Response<List<dynamic>> response = await dio.get<List<dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        queryParameters: queryParameters ?? {},
        options: Options(
          method: 'GET',
          headers: headers,
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } on DioException catch (e) {
      print(e);
      throw ExceptionHandler.errorResponseData(e);
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response<Map<String, dynamic>>> post(String endpoint,
      {required dynamic data,
      bool isProtected = false,
      bool isFormData = false,
      String? path,
      String? contentType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        queryParameters: queryParameters ?? {},
        data: data,
        options: Options(
          method: 'POST',
          headers: await getHeaders(isProtected),
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } on DioException catch (e) {
      print(e);
      throw ExceptionHandler.errorResponseData(e);
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response<Map<String, dynamic>>> postList(String endpoint,
      {required List<dynamic> data,
      bool isProtected = false,
      bool isFormData = false,
      String? path,
      String? contentType,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? queryParameters}) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.post<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        data: data,
        queryParameters: queryParameters ?? {},
        options: Options(
          method: 'POST',
          extra: <String, dynamic>{},
          headers: headers,
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } on DioException catch (error) {
      throw ExceptionHandler.handleError(error);
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response> patch(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = false,
    bool isFormData = false,
    String? path,
    String? contentType,
  }) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.patch<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        data: data,
        queryParameters: {},
        options: Options(
          method: 'PATCH',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } on DioException catch (error) {
      throw ExceptionHandler.handleError(error);
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response> put(
    String endpoint, {
    required Map<String, dynamic> data,
    bool isProtected = false,
    bool isFormData = false,
    String? path,
    String? contentType,
  }) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.put<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        data: data,
        queryParameters: {},
        options: Options(
          method: 'PUT',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Response<Map<String, dynamic>>> delete(String endpoint,
      {required Map<String, dynamic> data,
      bool isProtected = false,
      bool isFormData = false,
      String? path,
      String? contentType}) async {
    try {
      Response<Map<String, dynamic>> response =
          await dio.delete<Map<String, dynamic>>(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        queryParameters: {},
        options: Options(
          method: 'DELETE',
          extra: <String, dynamic>{},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  // multipart form data
  Future<Response<Map<String, dynamic>>> postFormData(
    String endpoint, {
    required FormData data,
    bool isProtected = false,
    bool isFormData = false,
    String? contentType,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    String? path,
  }) async {
    try {
      Response<Map<String, dynamic>> response = await dio.post(
        '${path ?? dotenv.env['baseUrl']}$endpoint',
        data: data,
        queryParameters: {},
        options: Options(
          method: 'POST',
          headers: <String, dynamic>{
            if (isProtected) 'Authorization': 'Bearer $_token',
          },
          extra: {},
          contentType: isFormData ? 'multipart/form-data' : contentType,
        ),
      );

      return response;
    } catch (e) {
      throw ExceptionHandler.handleError(e);
    }
  }

  Future<Map<String, dynamic>>? getHeaders(bool isProtected) async {
    var token =
        await localStorage.getSecureString(key: LocalStorageKeys.accessToken);
    return <String, String>{
      'x-channel': 'mobile',
      'x-clientid': clientId!,
      'Authorization': isProtected ? 'Bearer $token' : "",
    };
  }

  // getLoginHeaders() async {
  //   // var token = await localStorage.readData("access_token_grant_type");
  //   var token = await getIt<AuthDBLocalDatasource>()
  //       .getToken(token: SessionKeys.accessTokenGrantType);
  //   return <String, String>{
  //     'Content-Type': 'application/json',
  //     'Authorization': "Bearer $token"
  //   };
  // }
}
