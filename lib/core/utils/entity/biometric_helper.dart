import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _auth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> authenticate({
    String reason = 'Please authenticate to proceed',
  }) async {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason: reason,
      options: const AuthenticationOptions(biometricOnly: true),
    );
    return didAuthenticate;
  }
}
