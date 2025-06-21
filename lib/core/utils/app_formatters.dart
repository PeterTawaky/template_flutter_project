import 'package:intl/intl.dart';

class AppFormatters {
  static DateTime convertStringToDateTime({required String stringDate}) {
    DateTime date = DateTime.parse(stringDate);
    return date;
  }

  static String getFormattedDate({
    required DateTime date,
    String format = 'dd-MM-yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static String getFormattedTime({
    required DateTime time,
    String format = 'HH:mm',
  }) {
    return DateFormat(format).format(time);
  }

  static String getTimeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'just now';
    }
  }

  static String trimText({required String text, required int maxLength}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static String? getSpecificNumberOfWords(String? text, number) {
    if (text == null) {
      return null;
    }
    return text.substring(0, number);
  }

  static String capitalizeFirstLetter(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String capitalizeAll(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) => capitalizeFirstLetter(word)).join(' ');
  }
}
