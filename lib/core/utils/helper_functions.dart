import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:template_project/core/constants/app_colors.dart';
import 'package:template_project/core/services/cache/cache_helper.dart';
import 'package:template_project/core/services/cache/cache_keys.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperFunctions {
  static void showSnackBar({
    Color color = AppColors.bottomEllipseGrey,
    required String msg,
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 5),
        backgroundColor: color,
      ),
    );
  }

  static double getRandomDoubleNumber(int maxLimit) {
    Random random = Random();
    double raw = random.nextDouble() * maxLimit; // 0.0 to 5.0
    return double.parse(raw.toStringAsFixed(1)); // Rounded to 1 decimal place
  }

  static Future<void> launingchUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  static void showConfirmationDialog({
    required String title,
    required String message,
    required BuildContext context,
    required VoidCallback onConfirm,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(cancelText),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text(confirmText),
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
          ],
        );
      },
    );
  }

  static uploadImage({required ImageSource imageSource}) async {
    final pickedImage = await ImagePicker().pickImage(source: imageSource);
    if (pickedImage != null) {
      CachedData.setData(key: CacheKeys.profilePhoto, value: pickedImage.path);
    }
  }

  static String? getEmailSuggestion(String email) {
    final commonDomains = [
      'gmail.com',
      'yahoo.com',
      'outlook.com',
      'hotmail.com',
    ];
    final parts = email.split('@');

    if (parts.length == 2) {
      final domain = parts[1].toLowerCase();
      final matchedDomain = commonDomains.firstWhere(
        (d) => d.startsWith(domain) || domain.startsWith(d),
        orElse: () => '',
      );

      if (matchedDomain.isNotEmpty && matchedDomain != domain) {
        return 'Did you mean ${parts[0]}@$matchedDomain?';
      }
    }
    return null;
  }

  static double calculatePasswordStrength(String password) {
    double strength = 0;

    // Length contributes up to 40% of strength
    strength += (password.length / 20).clamp(0, 0.4);

    // Character variety contributes up to 60%
    bool hasUpper = password.contains(RegExp(r'[A-Z]'));
    bool hasLower = password.contains(RegExp(r'[a-z]'));
    bool hasDigit = password.contains(RegExp(r'[0-9]'));
    bool hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    int varietyCount =
        [hasUpper, hasLower, hasDigit, hasSpecial].where((e) => e).length;
    strength += (varietyCount * 0.15);

    return strength.clamp(0, 1);
  }

  Widget buildPasswordStrengthIndicator({required double strength}) {
    return LinearProgressIndicator(
      value: strength,
      backgroundColor: Colors.grey[300],
      color: _getStrengthColor(strength: strength),
      minHeight: 6,
    );
  }

  Widget buildPasswordStrengthText({required double strength}) {
    String text;
    if (strength == 0) {
      text = '';
    } else if (strength < 0.3) {
      text = 'Weak';
    } else if (strength < 0.6) {
      text = 'Fair';
    } else if (strength < 0.8) {
      text = 'Good';
    } else {
      text = 'Strong';
    }

    return Text(
      text,
      style: TextStyle(
        color: _getStrengthColor(strength: strength),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Color _getStrengthColor({required double strength}) {
    if (strength < 0.3) return Colors.red;
    if (strength < 0.6) return Colors.orange;
    if (strength < 0.8) return Colors.blue;
    return Colors.green;
  }

  static removeDuplicates({required List<dynamic> list}) {
    return list.toSet().toList();
  }

  static List<T> filterList<T>(List<T> list, bool Function(T) test) {
    return list.where(test).toList();
  }
  
}
