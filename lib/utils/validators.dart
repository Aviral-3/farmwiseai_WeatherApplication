class Validators {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  static String? validateAddress(String value) {
    // Optional: Add specific validation for address if needed
    return null;
  }

  static String? validateNumber(String value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

// Add other specific validators as needed
}
