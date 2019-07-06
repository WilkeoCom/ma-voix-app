import 'package:validators/validators.dart';

class ValidationMixin {
  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Password must be at least 4 characters';
    }
    return null;
  }

  String validateEmail(String value) {
    if (!isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
