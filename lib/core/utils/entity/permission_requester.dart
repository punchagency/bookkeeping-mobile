import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequester {
  static Future<void> requestPermission({
    required Permission permission,
    required VoidCallback onGranted,
    Function? onDenied,
    Function? onPermanentlyDenied,
  }) async {
    PermissionStatus status = await permission.request();

    switch (status) {
      case PermissionStatus.granted:
        onGranted();
        break;
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
        onDenied?.call();
        break;
      case PermissionStatus.permanentlyDenied:
        onPermanentlyDenied?.call();
        break;
      default:
        break;
    }
  }
}
