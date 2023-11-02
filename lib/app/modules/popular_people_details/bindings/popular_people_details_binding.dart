import 'package:get/get.dart';
import 'package:movie_task/app/data/providers/popular_people_details_provider.dart';

import '../controllers/popular_people_details_controller.dart';

class PopularPeopleDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PopularPeopleDetailsProvider());
    Get.lazyPut<PopularPeopleDetailsController>(
      () => PopularPeopleDetailsController(),
    );
  }
}
