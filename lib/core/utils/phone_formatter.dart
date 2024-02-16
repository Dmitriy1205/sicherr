class PhoneFormatter {
  static String formatPhone(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return phoneNumber;
    }
    bool isFirstPlus = phoneNumber.startsWith('+');
    final formattedPhone = phoneNumber.replaceAll(RegExp(r"\D"), "");

    return isFirstPlus ? '+$formattedPhone' : formattedPhone;
  }
}
