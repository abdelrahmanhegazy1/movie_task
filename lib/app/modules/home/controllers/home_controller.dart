import 'package:get/get.dart';
import 'package:movie_task/app/data/exceptions/network_exception.dart';
import 'package:movie_task/app/data/models/popular_people_model.dart';
import 'package:movie_task/app/data/providers/home_provider.dart';
import 'package:movie_task/app/data/services/hive_service.dart';
import 'package:movie_task/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin<List<PopularPeople>>,ScrollMixin {
  late HomeProvider _homeProvider;
  late HiveStorageService hiveStorageService;
  PopularPeopleResponse? popularPeopleResponse;
  List<PopularPeople> popularPeopleList= [];
  RxBool loading = false.obs;
  RxBool hasNetwork = true.obs;
  int currentPage=1;
  @override
  void onInit() {
    _homeProvider = Get.find<HomeProvider>();
    hiveStorageService = Get.find<HiveStorageService>();
    getPopularPeople();
    super.onInit();
  }

  void getPopularPeople() async{
    popularPeopleResponse = await _homeProvider.getPopularPeople(page: currentPage)
    .catchError((error) async{
      if(error is NetworkException){
        List<PopularPeople> pop = await hiveStorageService.getPopularPeopleList();
        popularPeopleList.addAll(pop);
        change(popularPeopleList, status: RxStatus.success());
        hasNetwork.value=false;
      }
      return null;
    });
    if(popularPeopleResponse!=null){
      
      popularPeopleList.addAll(popularPeopleResponse!.results);
      change(popularPeopleList, status: RxStatus.success());
      for(int i=0;i<popularPeopleResponse!.results.length;i++){
        await hiveStorageService.addPopularPeople(popularPeopleResponse!.results[i]);
      }
      currentPage++;
    }
    else {
    }
  }
  void navigateToDetailsScreen(PopularPeople popularPeople){
    Get.toNamed(Routes.POPULAR_PEOPLE_DETAILS, arguments: {"peopleID":popularPeople.id});
  }
  @override
  Future<void> onEndScroll()async {
    if(popularPeopleResponse!=null&&popularPeopleResponse!.page<popularPeopleResponse!.totalPages)
    {
    getPopularPeople();
    }
  }
  
  @override
  Future<void> onTopScroll() {
    // TODO: implement onTopScroll
    throw UnimplementedError();
  }

}
