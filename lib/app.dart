import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elmer/config/theme/theme.dart';
import 'package:elmer/config/theme/theme_provider.dart';
import 'package:elmer/core/appcontroller/AppControlTimer.dart';
import 'package:elmer/core/di-manual/di_manual.dart';
import 'package:elmer/core/routes/route.dart';
import 'package:elmer/features/auth/presentation/notifier/auth_notifier.dart';
import 'package:elmer/features/splash_screen/splash.dart';
import 'flavor.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

bool userIsInsideApp = false;

class spaceAppApp extends StatefulWidget {
  const spaceAppApp({super.key});

  @override
  State<spaceAppApp> createState() => _spaceAppAppState();
}

class _spaceAppAppState extends State<spaceAppApp> {
  SharedPreferences? prefs;
  bool isUserSystemActive = true;
  bool isFirstLaunch = true;
  bool isReturnThemeModeDark = false;
  bool isReturnThemeModeLight = false;

  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    super.initState();
    // languageCheck();

    log("baseURL ${dotenv.env['baseUrl']}");
  }

  // languageCheck() async {
  //   await context.read<LanguageProvider>().loadLocale();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: getIt<LoginNotifier>()),
      ],
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                // locale: value.locale,
                // localizationsDelegates:
                //     AppLocalizations.localizationsDelegates,
                // supportedLocales: AppLocalizations.supportedLocales,
                themeMode: themeProvider.themeMode,
                theme: lightTheme,
                // darkTheme: darkTheme,
                navigatorKey: navigatorKey,
                builder: (xcontext, child) {
                  return AppControllerTimer(
                      context: context,
                      onTimeExpired: () {
                        if (userIsInsideApp &&
                            (F.appFlavor == Flavor.prod ||
                                F.appFlavor == Flavor.stg)) {
                          debugPrint("the sesion has timed out");

                          Future.delayed(Duration.zero).then(
                            (value) {
                              showInactivityAlert(navigatorKey.currentContext!);
                            },
                          );
                        }
                      },
                      child: child!);
                },
                debugShowCheckedModeBanner: false,
                title: F.title,
                initialRoute: Splash.routeName,
                onGenerateRoute: onGenerateRoute,
              );
            },
          );
        },
      ),
    );
  }
}

showInactivityAlert(BuildContext xcontext) {
  showDialog(
    context: xcontext,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        child: Container(
          height: 160,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                "Session Timeout",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "Please log in again to continue",
                        textAlign: TextAlign.center,
                      ))),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70),
                child: ElevatedButton(
                  // isActive: true,
                  // height: 50.h,
                  // width: 360.w,
                  onPressed: () {
                    userIsInsideApp = false;
                    Navigator.pop(xcontext, true);
                    // Navigator.of(xcontext).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (pcontext) => LoginBaseView()),
                    //     (Route<dynamic> route) => false);
                  },
                  child: Text('yes'),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
