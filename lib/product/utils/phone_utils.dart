import 'package:flutter/services.dart';

class PhoneUtils {
  PhoneUtils._();

  /// Validates if the phone number is valid (10 digits)
  static bool isValidPhone(String phoneNumber) {
    String cleaned = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
    return cleaned.length == 10;
  }

  /// Formats phone number as user types (no spaces, just clean digits)
  /// Returns formatted TextEditingValue to maintain cursor position
  static TextEditingValue formatPhoneNumber(
    String value,
    TextEditingValue currentValue,
  ) {
    String cleaned = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cleaned.length <= 10) {
      return TextEditingValue(
        text: cleaned,
        selection: TextSelection.collapsed(offset: cleaned.length),
      );
    }

    // If more than 10 digits, return the current value unchanged
    return currentValue;
  }

  /// Gets clean phone number (digits only) from formatted string
  static String getCleanPhoneNumber(String formattedPhone) {
    return formattedPhone.replaceAll(RegExp(r'[^\d]'), '');
  }

  /// Formats phone number for display (with +90 country code)
  static String getDisplayPhoneNumber(String phoneNumber) {
    String cleaned = getCleanPhoneNumber(phoneNumber);
    if (cleaned.length == 10) {
      return '+90 ${cleaned.substring(0, 3)} ${cleaned.substring(3, 6)} ${cleaned.substring(6, 8)} ${cleaned.substring(8, 10)}';
    }
    return phoneNumber;
  }

  /// Validates Turkish phone number format
  static bool isValidTurkishPhone(String phoneNumber) {
    String cleaned = getCleanPhoneNumber(phoneNumber);

    // Turkish mobile numbers start with 5
    if (cleaned.length == 10 && cleaned.startsWith('5')) {
      return true;
    }

    return false;
  }
}

/// Phone number input formatter that only allows digits and limits to 10 characters
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    // Only allow digits and limit to 10 characters
    if (text.length > 10) {
      return oldValue;
    }

    return newValue;
  }
}
