import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/messages_constanst.dart';
import 'package:movie_task/app/data/models/people_details_model.dart';
import 'package:movie_task/app/data/models/people_images_model.dart';
import 'package:movie_task/app/data/providers/popular_people_details_provider.dart';
import 'package:movie_task/app/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class PopularPeopleDetailsController extends GetxController {
  late int peopleId ;
  late PopularPeopleDetailsProvider popularPeopleDetailsProvider;
  PeopleDetails? peopleDetails;
  PeopleImages? peopleImages;
  RxBool hasNetwork = true.obs;
  RxBool loading = false.obs;
  int selectedImageIndex=0;
  @override
  void onInit() {
    popularPeopleDetailsProvider = Get.find<PopularPeopleDetailsProvider>();
    peopleId = Get.arguments["peopleID"];
    getPeopleDetails();
    super.onInit();
  }

  Future<void> getPeopleDetails () async{
  startLoading();
  peopleDetails = await  popularPeopleDetailsProvider.getPopularPeopleDetails(personId: peopleId)
  .catchError((error){
      hasNetwork.value =false;
  });
  await getImages();
  cancelLoading();
  }
  Future<void> getImages () async{
  peopleImages = await  popularPeopleDetailsProvider.getPopularPeopleImages(personId: peopleId)
  .catchError((error){
      hasNetwork.value =false;
  });
  }
  void navigateToImageScreen(int index){
    selectedImageIndex = index;
    Get.toNamed(Routes.POPULAR_PEOPLE_IMAGE_SCREEN);
  }

  void downloadPhoto() async{
     http.Response result = await popularPeopleDetailsProvider.downloadPhoto(
      imageUrl: AppConstants.kImageBaseUrl+peopleImages!.profiles[selectedImageIndex].filePath);
    if(result.statusCode ==200){
      final appDocumentsDirectory = Directory('/storage/emulated/0/Download');
      final peopleImagePath = appDocumentsDirectory.path+peopleImages!.profiles[selectedImageIndex].filePath;
      final file = File(peopleImagePath);
      await file.writeAsBytes(result.bodyBytes);
      Fluttertoast.showToast(
        msg: MessagesConstants.kImageDownloadedSuccessfully,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
    }
    else {
      Fluttertoast.showToast(
        msg: MessagesConstants.kImageDownloadFailed,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
    }
  }
  void startLoading(){
    loading.value=true;
  }
  void cancelLoading(){
    loading.value=false;
  }

}
