import 'package:get/get.dart';
import 'package:movie_task/app/data/providers/home_provider.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeProvider());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
