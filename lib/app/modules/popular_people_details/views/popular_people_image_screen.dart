import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/app_text_style.dart';
import 'package:movie_task/app/modules/popular_people_details/controllers/popular_people_details_controller.dart';

class PopularPeopleImageScreen extends GetView<PopularPeopleDetailsController> {
  const PopularPeopleImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AspectRatio(
                aspectRatio:
                    controller.peopleImages?.profiles[controller.selectedImageIndex].aspectRatio ??
                        0.0,
                child: Image.network(AppConstants.kImageBaseUrl+controller.peopleImages!.profiles[controller.selectedImageIndex].filePath),
              ),
            
            ElevatedButton(onPressed: controller.downloadPhoto, child: Text(
              AppConstants.kDownloadImage,style: AppTextStyles.bodyTitle,
            ))
          ],
        ),
      ),
    );
  }
}
