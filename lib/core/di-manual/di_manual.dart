import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

Future<void> setUp() async {
  ///network
  BaseOptions options = BaseOptions(
    baseUrl: "${dotenv.env['baseUrl']}",
    receiveDataWhenStatusError: true,
    sendTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(seconds: 30),
    // 60 seconds
    receiveTimeout: const Duration(seconds: 25), // 60 seconds
  );

  //module
  var dio = Dio(options);

  getIt.registerLazySingleton<Dio>(() => dio);

  dio.interceptors.add(
    PrettyDioLogger(
        requestBody: true,
        //true
        requestHeader: true,
        //true
        responseBody: true,
        //true
        responseHeader: true,
        //false
        compact: true,
        //false
        error: true,
        //true
        maxWidth: 90),
  );
  // dioAppDynamicsTracked.options = options;

  //trackedDio
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ),
  );

  var fluttersecuredstorage = const FlutterSecureStorage();
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => fluttersecuredstorage,
  );

  //storage
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return sharedPreferences;
  });

  // getIt.registerLazySingleton<FirebaseMessaging>(
  //   () => FirebaseMessaging.instance,
  // );
  // getIt.registerLazySingleton<FirebaseCrashlytics>(
  //   () => FirebaseCrashlytics.instance,
  // );

  ////Things to inject and where to inject them.
  ///DATASOUCRE
  ///REPO
  ///NOTIFIER
  ///USECASE

  // datasource
  // datasource
  // datasource
  // datasource

  // getIt.registerLazySingleton<DBLocalDatasource>(() => DBLocalDatasourceImpl(
  //     secureStorage: getIt(), sharedPreferences: getIt()));

// repo
// repo
// repo
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     localStorage: getIt(),
  //     remoteDatasource: getIt(),
  //   ),

////////////
////////////
  // Notifier
  // Notifier
  // Notifier
  // getIt.registerFactory<OnboardingNotifier>(
  //     () => OnboardingNotifier(repository: getIt()));

  // //usecases

  // getIt.registerLazySingleton(
  //   () => GetUserProfileUsecase(repository: getIt()),
  // );
}
