import 'package:get/get.dart';
import 'package:movie_task/app/modules/popular_people_details/views/popular_people_image_screen.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/popular_people_details/bindings/popular_people_details_binding.dart';
import '../modules/popular_people_details/views/popular_people_details_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.POPULAR_PEOPLE_DETAILS,
      page: () => const PopularPeopleDetailsView(),
      binding: PopularPeopleDetailsBinding(),
    ),
    GetPage(
     name: _Paths.POPULAR_PEOPLE_IMAGE_SCREEN,
     page: () => const PopularPeopleImageScreen()
    ),
  ];
}
