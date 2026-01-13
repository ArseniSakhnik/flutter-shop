import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate([DateTime? date]) {
    final value = date ?? DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(value);
  }

  static String formatCurrency(
    double amount, {
    String locale = 'en_US',
    String symbol = '\$',
  }) {
    return NumberFormat.currency(locale: locale, symbol: symbol).format(amount);
  }

  static String formatPhoneNumber(String phoneNumber) {
    final digits = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // US: (123) 456-7890
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) '
          '${digits.substring(3, 6)}-'
          '${digits.substring(6)}';
    }

    // US with country code: +1 (123) 456-7890
    if (digits.length == 11 && digits.startsWith('1')) {
      return '+1 (${digits.substring(1, 4)}) '
          '${digits.substring(4, 7)}-'
          '${digits.substring(7)}';
    }

    return phoneNumber;
  }

  // Not fully tested.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (digitsOnly.length < 2) {
      return phoneNumber;
    }

    // Extract the country code (первые 2 цифры)
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('$countryCode ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;

      // Для +1 первая группа из 3 цифр
      if (i == 0 && countryCode == '+1' && digitsOnly.length >= 3) {
        groupLength = 3;
      }

      int end = i + groupLength;
      if (end > digitsOnly.length) {
        end = digitsOnly.length;
      }

      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }

      i = end;
    }

    return formattedNumber.toString();
  }
}
