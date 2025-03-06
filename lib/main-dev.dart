import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:elmer/config/theme/theme_provider.dart';
import 'package:elmer/features/auth/presentation/notifier/auth_notifier.dart';
import 'app.dart';
import 'core/di-manual/di_manual.dart';
import 'core/networkhandler/httpcert.dart';
import 'flavor.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    await initializeApp();

    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(context),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => LanguageProvider(),
          // ),
        ],
        builder: (_, child) {
          return const spaceAppApp();
        }));
  }, (error, stack) async {
    // getIt<FirebaseCrashlytics>().recordError(error, stack);
  });
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Register dependencies
  getIt.registerLazySingleton<LoginNotifier>(() => LoginNotifier());

  F.appFlavor = Flavor.dev; // Example
  HttpOverrides.global = MyHttpOverrides();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: '.dev.env');
  await setUp();

  Future.delayed(const Duration(seconds: 1)).then((value) async {
    log("test flavor detected ${F.appFlavor}");
    // Additional initialization here if needed
  });
}


// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   final fbMessaging = getIt<FirebaseMessagingService>();
//   fbMessaging.onBackGroundMessage(message);
// }



// run app
// flutter build apk --flavor dev -t lib/main-dev.dart
//

//store
// flutter build appbundle --flavor prod -t lib/main.dart
//   --obfuscate --split-debug-info


// run app ios
// flutter run --target lib/main-dev.dart --flavor dev