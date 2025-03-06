import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:elmer/app.dart';
import 'package:elmer/config/theme/theme_provider.dart';
import 'package:elmer/core/di-manual/di_manual.dart';
import 'package:elmer/core/networkhandler/httpcert.dart';
import 'flavor.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    await initializeApp();

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
    // getIt<FirebaseCrashlytics>().recordError(error, stack);
  });
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  F.appFlavor = Flavor.stg;
  HttpOverrides.global = MyHttpOverrides();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load(fileName: '.stag.env');
  await setUp();
  Future.delayed(const Duration(seconds: 2)).then((value) async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // var t = await getIt<FirebaseMessagingService>().configureMessaging();
    // print('$t token');
    // await getIt<FirebaseCrashlytics>().setCrashlyticsCollectionEnabled(true);
    // FlutterError.onError = getIt<FirebaseCrashlytics>().recordFlutterFatalError;
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // FlutterError.onError = Instrumentation.errorHandler;
  });

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     print(
  //         'Message also contained a notification: ${message.notification!.body}');
  //   }
  // });
  // FlutterError.onError = Instrumentation.errorHandler;
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   final fbMessaging = getIt<FirebaseMessagingService>();
//   fbMessaging.onBackGroundMessage(message);
// }


// flutter build apk --flavor pilot -t lib/main-pilot.dart