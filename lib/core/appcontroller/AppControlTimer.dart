import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppControllerTimer extends StatefulWidget {
  final Widget child;
  final BuildContext context;
  final VoidCallback onTimeExpired;

  const AppControllerTimer({
    super.key,
    required this.child,
    required this.context,
    required this.onTimeExpired,
  });

  static AppControllerTimerState? of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>())
        ?.data;
  }

  @override
  AppControllerTimerState createState() => new AppControllerTimerState();
}

class AppControllerTimerState extends State<AppControllerTimer> {
  int sessionDuration = 300;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    _timer = AppControllerTimer.of(context)?._timer;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _initializeTimer();

    return _InheritedStateContainer(
      data: this,
      child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _handleUserInteraction,
          onPanDown: _handleUserInteraction,
          child: widget.child),
    );
  }

  void _handleUserInteraction([_]) {
    // print("--- OLD TIMER TICKER: --> ${_timer?.tick}");
    refreshTimer();
    // print("--- NEW TIMER TICK: --> ${_timer.tick}");
  }

  void _initializeTimer() {
//    print("...INITIALIZE TIMEOUT HERE...");

    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(seconds: sessionDuration), _logOutUser);

    debugPrint("the timer is ${_timer!.tick}");
  }

  void refreshTimer() {
//    print("REFRESH TIMEOUT HERE...");
    if (_timer != null) {
//      print("Timer is non null :: Tick => ${_timer.tick}");
      _timer?.cancel();
    }

    if (_timer != null && _timer!.isActive) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(seconds: sessionDuration), _logOutUser);
    debugPrint("the  refresh timer is ${_timer!.tick}");
  }

  void _logOutUser() {
    widget.onTimeExpired();
    _timer?.cancel();
    _timer = null;
  }
}

class _InheritedStateContainer extends InheritedWidget {
  final AppControllerTimerState data;

  _InheritedStateContainer({
    required this.data,
    required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
