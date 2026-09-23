part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const SPLASHSCREEN = _Paths.SPLASHSCREEN;
  static const ROOT = _Paths.ROOT;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();

  static const SPLASHSCREEN = '/splashscreen';
  static const ROOT = '/root';
  static const LOGIN = '/login';
}
