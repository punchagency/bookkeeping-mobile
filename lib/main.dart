import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:elmer/app.dart';
import 'package:elmer/config/theme/theme_provider.dart';
import 'package:elmer/core/networkhandler/httpcert.dart';
import 'core/di-manual/di_manual.dart';
import 'flavor.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
void main() async {
  runZonedGuarded<Future<void>>(() async {
    await initializeApp();
    // FlutterError.onError = Instrumentation.errorHandler;
    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(context),
          ),
        ],
        builder: (_, child) {
          return const spaceAppApp();
        }));
  }, (error, stack) async {
    // final details =
    //     FlutterErrorDetails(exception: error.toString(), stack: stack);
    // await Instrumentation.errorHandler(details);

    // getIt<FirebaseCrashlytics>().recordError(error, stack);
  });
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  // getIt.registerLazySingleton<FirebaseCrashlytics>(
  //     () => FirebaseCrashlytics.instance);
  F.appFlavor = Flavor.prod;
  HttpOverrides.global = MyHttpOverrides();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: '.env');
  await setUp();
  await Future.delayed(const Duration(seconds: 1)).then((value) async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // await getIt<FirebaseMessagingService>().configureMessaging();
    // await Future.delayed(const Duration(seconds: 0)).then((value) async {
    //   await getIt<FirebaseCrashlytics>().setCrashlyticsCollectionEnabled(true);
    //   FlutterError.onError =
    //       getIt<FirebaseCrashlytics>().recordFlutterFatalError;
    // });
  });

  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   final fbMessaging = getIt<FirebaseMessagingService>();
//   fbMessaging.onBackGroundMessage(message);
// }



//  flutter run --target lib/main-dev.dart --flavor prod



//to build for store

// flutter build appbundle --flavor prod -t lib/main.dart
//   --obfuscate --split-debug-info

// runing target main.dev
//flutter run --target lib/main-dev.dart