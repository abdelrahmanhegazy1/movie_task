import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:movie_task/app/core/values/app_colors.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/app_text_style.dart';
import 'package:movie_task/app/data/models/popular_people_model.dart';
import 'package:movie_task/app/modules/home/controllers/home_controller.dart';

class PopularPeopleCard extends GetView<HomeController>{
  final PopularPeople popularPeople;
  const PopularPeopleCard(this.popularPeople, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.15,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.kDarkGrayColor),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: 
                 AppConstants.kImageBaseUrl + popularPeople.profilePath,
                 placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      popularPeople.name,
                      style: AppTextStyles.headingTitle,
                    ),
                  ),
                  
                  ...popularPeople.knownFor
                        .map(
                          (movie) => Flexible(
                            child: Row(
                              children: [
                                Icon(Icons.movie_filter_outlined,size: 15.h,),
                                SizedBox(width: 5.w,),
                                Flexible(
                                  child: Text(
                                    movie.title??movie.name??"",
                                    style: AppTextStyles.bodyTitle,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
