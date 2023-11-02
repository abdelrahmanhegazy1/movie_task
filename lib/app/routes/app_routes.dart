part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const POPULAR_PEOPLE_DETAILS = _Paths.POPULAR_PEOPLE_DETAILS;
  static const POPULAR_PEOPLE_IMAGE_SCREEN = _Paths.POPULAR_PEOPLE_IMAGE_SCREEN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const POPULAR_PEOPLE_DETAILS = '/popular-people-details';
  static const POPULAR_PEOPLE_IMAGE_SCREEN = '/popular-people-screen';
}
