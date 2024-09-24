import 'package:logger/logger.dart';

Logger _logger = Logger();

void logInfo(String message) {
  _logger.i(message);
}

void logWarning(String message) {
  _logger.w(message);
}

void logError(String message, [Object? error, StackTrace? stackTrace]) {
  _logger.e(
    message,
    error: error,
    stackTrace: stackTrace,
    time: DateTime.now(),
  );
}

void logDebug(String message) {
  _logger.d(message);
}

void logTrace(String message) {
  _logger.t(message);
}

void logFatal(String message, [Object? error, StackTrace? stackTrace]) {
  _logger.f(
    message,
    error: error,
    stackTrace: stackTrace,
    time: DateTime.now(),
  );
}
