import 'package:get/get.dart';
import 'package:university_helper/app/global_widgets/search/search_delegate.dart';
import 'package:university_helper/app/modules/main_screen.dart';
import 'package:university_helper/app/modules/main_screen_binding.dart';
import 'package:university_helper/app/modules/popular/bindings/popular_screen_binding.dart';
import 'package:university_helper/app/modules/popular/popular_screen.dart';
import 'package:university_helper/app/modules/popular_detail/popular_detail_screen.dart';
import 'package:university_helper/app/modules/popular_detail/popular_detail_screen_binding.dart';
import 'package:university_helper/app/utils/custom_search.dart';

abstract class Routes {
  static const SEARCH = _Paths.SEARCH;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;
  static const PROFILE = _Paths.PROFILE;
  static const SETTINGS = _Paths.SETTINGS;
  static const WELCOME = _Paths.WELCOME;
  static const HOME = _Paths.HOME;
  static const POPULAR_DETAIL = _Paths.POPULAR_DETAIL;
  static const POPULAR = _Paths.POPULAR;
  static const MAIN_SCREEN = _Paths.MAIN_SCREEN;
}

abstract class _Paths {
  static const SEARCH = '/search';
  static const SPLASH_SCREEN = '/splash-screen';
  static const PROFILE = '/profile';
  static const SETTINGS = '/settings';
  static const WELCOME = '/welcome';
  static const HOME = '/home';
  static const POPULAR = '/popular-screen';
  static const POPULAR_DETAIL = '/popular-detail';
  static const MAIN_SCREEN = '/main-screen';
  static const SEARCH_SCREEN = '/search-screen';
}

class AppPages {
  static const INITIAL = Routes.MAIN_SCREEN;
  static final routes = [
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => SearchPage(
        delegate: MySearchDelegate(),
      ),
    ),
    GetPage(
      name: _Paths.MAIN_SCREEN,
      page: () => MainScreen(),
      binding: MainScreenBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR,
      page: () => PopularScreen(),
      binding: PopularScreenBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR_DETAIL,
      page: () => PopularDetailScreen(),
      binding: PopularDetailScreenBinding(),
    ),
  ];
}
