import 'package:logger/logger.dart';

late Logger _logger;

void initLogger() {
  _logger = Logger(
    printer: PrettyPrinter(
      lineLength: 180,
      colors: true,
      printEmojis: true,
      printTime: false,
      methodCount: 0,
      errorMethodCount: 10,
    ),
  );
}

void logV(dynamic message) {
  _logger.v(message);
}

void logD(dynamic message) {
  _logger.d(message);
}

void logI(dynamic message) {
  _logger.i(message);
}

void logW(dynamic message) {
  _logger.w(message);
}

void logE(dynamic message) {
  _logger.e(message);
}

void logWTF(dynamic message) {
  _logger.wtf(message);
}
