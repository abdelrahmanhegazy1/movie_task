import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/app_text_style.dart';
import 'package:movie_task/app/core/values/messages_constanst.dart';

import '../controllers/popular_people_details_controller.dart';

class PopularPeopleDetailsView extends GetView<PopularPeopleDetailsController> {
  const PopularPeopleDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Obx(
             () {
              return controller.loading.isTrue? const Center(child: CircularProgressIndicator(),):
               controller.hasNetwork.isFalse?const Center(child: Text(MessagesConstants.kNetworkNotAvailable),) :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: SizedBox(
                          width: 100.w,
                          height: 150.h,
                          child: Image.network(
                            AppConstants.kImageBaseUrl + controller.peopleDetails!.profilePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.peopleDetails!.name,
                            style: AppTextStyles.headingTitle,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            AppConstants.kKnownFor,
                            style: AppTextStyles.bodyTitle,
                          ),
                          Text(
                            controller.peopleDetails!.knownForDepartment,
                            style: AppTextStyles.bodyTitleLightGrey,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            AppConstants.kBirthPlace,
                            style: AppTextStyles.bodyTitle,
                          ),
                          Text(
                            controller.peopleDetails!.placeOfBirth,
                            style: AppTextStyles.bodyTitleLightGrey,
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            AppConstants.kDateOfBirth,
                            style: AppTextStyles.bodyTitle,
                          ),
                          Text(
                            DateFormat('dd MMMM yyyy').format(controller.peopleDetails!.birthday),
                            style: AppTextStyles.bodyTitleLightGrey,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppConstants.kBiography,
                    style: AppTextStyles.headingTitle,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    controller.peopleDetails!.biography,
                    style: AppTextStyles.bodyTitleLightGrey,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    AppConstants.kImages,
                    style: AppTextStyles.headingTitle,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GridView.builder(
                    physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, 
                        mainAxisSpacing: 8.0, 
                        crossAxisSpacing: 8.0,
                      ),
                      shrinkWrap: true,
                      itemCount: controller.peopleImages!.profiles.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index){
                        return InkWell(
                          onTap: () {
                            controller.navigateToImageScreen(index);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.r),
                            child: SizedBox(
                              height: 10.h,
                              width: 10.w,
                              child: Image.network(AppConstants.kImageBaseUrl+controller.peopleImages!.profiles[index].filePath,fit: BoxFit.fill,),),
                          ),
                        );
                      })
                ],
              );
            }
          ),
        ),
      )),
    );
  }
}
