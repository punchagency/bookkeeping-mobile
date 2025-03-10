import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension BuildContextNotifier on BuildContext {
  // DashBoardNotifier get mynotifier =>
  //     Provider.of<DashBoardNotifier>(this, listen: false);

  T readNotifier<T>() => Provider.of<T>(this, listen: false);

  T watchNotifier<T>() => Provider.of<T>(this, listen: true);

  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);

  Size get screenSize => MediaQuery.of(this).size;
}
