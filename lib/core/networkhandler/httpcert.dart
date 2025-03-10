import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     const expectedHost =
//         "spaceApp-customer-dev-v3.az-sterlingapp-tcoe-dev.p.azurewebsites.net";

//     SecurityContext securityContext = SecurityContext(withTrustedRoots: false);

//     return super.createHttpClient(securityContext)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port) {
//         print(host);
//         return _validateCertificate(cert, host, expectedHost);
//       };
//   }

//   bool _validateCertificate(
//       X509Certificate cert, String host, String expectedHost) {
//     // Example of hostname validation
//     if (host == expectedHost) {
//       return true;
//     }
//     print('Check completed');
//     return false;
//   }
// }
