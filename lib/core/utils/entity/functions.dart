String? maskPhoneNumber(String phoneNumber) {
  String normalizedNumber = phoneNumber;

  if (phoneNumber.startsWith('234')) {
    normalizedNumber = phoneNumber.substring(3);
  } else if (phoneNumber.startsWith('+234')) {
    normalizedNumber = phoneNumber.substring(4);
  }

  if (normalizedNumber.length < 10) {
    return null;
  }

  return phoneNumber.replaceRange(
      phoneNumber.length - 10, phoneNumber.length - 3, '*******');
}

String? maskEmailAddress(String email) {
  final parts = email.split('@');
  if (parts.length != 2) {
    return null;
  }

  final localPart = parts[0];
  final domainPart = parts[1];

  if (localPart.length <= 2) {
    return email;
  }

  final maskedLocal = localPart[0] +
      '*' * (localPart.length - 2) +
      localPart[localPart.length - 1];

  return '$maskedLocal@$domainPart';
}
