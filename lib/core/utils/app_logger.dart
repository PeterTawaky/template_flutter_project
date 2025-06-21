import 'package:logger/logger.dart';

class AppLogger {
  static var logger = Logger();

  static void trace(String message) => logger.t(message);
  static void debug(String message) => logger.d(message);
  static void info(String message) => logger.i(message);
  static void warning(String message) => logger.w(message);
  static void error(String message) => logger.e(message, error: 'Test Error');
}
