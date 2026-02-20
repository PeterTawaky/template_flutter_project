// validation_extensions.dart

/// Email validation, as extensions on `String?`
extension EmailValidationX on String? {
  /// Returns an error message if invalid; `null` if valid.
  String? validateEmailCreation() {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }

    // Trim the value
    final email = value.trim();

    // Basic email pattern (kept from your original logic)
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      return 'Please enter a valid email address';
    }

    // No spaces
    if (email.contains(' ')) {
      return 'Email should not contain spaces';
    }

    // Only one '@'
    if ('@'.allMatches(email).length > 1) {
      return 'Email should contain only one @ symbol';
    }

    // Domain validity
    final parts = email.split('@');
    if (parts.length != 2) return 'Invalid email format';

    final domain = parts[1];
    if (domain.isEmpty) {
      return 'Domain part is missing';
    }

    // Valid domain extension
    if (!RegExp(r'^[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(domain)) {
      return 'Invalid domain format';
    }

    // No consecutive dots
    if (domain.contains('..')) {
      return 'Domain should not contain consecutive dots';
    }

    // TLD length
    final domainParts = domain.split('.');
    if (domainParts.length < 2) {
      return 'Invalid domain structure';
    }

    final tld = domainParts.last;
    if (tld.length < 2) {
      return 'Top-level domain should be at least 2 characters';
    }

    // Disposable domains check
    const disposableDomains = [
      'tempmail.com',
      'mailinator.com',
      '10minutemail.com',
      'guerrillamail.com',
      'throwawaymail.com',
      'fakeinbox.com',
    ];
    if (disposableDomains.any((d) => domain.toLowerCase().contains(d))) {
      return 'Disposable email addresses are not allowed';
    }

    // Professional checks
    if (email.startsWith('.')) {
      return 'Email should not start with a dot';
    }
    if (email.endsWith('.')) {
      return 'Email should not end with a dot';
    }

    return null; // valid
  }
}

/// Password validation
extension PasswordValidationX on String? {
  /// Strong password rules; returns error message or `null` if valid.
  String? validateStrongPassword() {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    final commonPasswords = ['password', '12345678', 'qwerty'];
    if (commonPasswords.contains(value.toLowerCase())) {
      return 'This password is too common';
    }

    return null;
  }

  /// Simple required check; returns error message or `null` if non-empty.
  String? validatePassword() {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}

/// Phone number validation
extension PhoneValidationX on String? {
  /// Validates length after stripping non-digits; returns error or `null`.
  String? validatePhoneNumber() {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }

    // Remove all non-digit characters
    final digitsOnly = value.replaceAll(RegExp(r'[^\d]'), '');

    if (digitsOnly.length < 7) {
      return 'Phone number is too short';
    }
    if (digitsOnly.length > 15) {
      return 'Phone number is too long';
    }
    return null;
  }
}

/// Name / nickname validation
extension NameValidationX on String? {
  /// Ensures name is 2..30 chars after trim; returns error or `null`.
  String? validateName() {
    final value = this;
    if (value == null || value.isEmpty) {
      return 'Please enter your name or nickname';
    }

    final trimmed = value.trim();

    if (trimmed.length < 2) {
      return 'Name is too short (min 2 characters)';
    }
    if (trimmed.length > 30) {
      return 'Name is too long (max 30 characters)';
    }

    return null;
  }
}
