import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/messages_constanst.dart';
import 'package:movie_task/app/modules/home/views/local_widgets/popular_people_card.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.kAppName),
        centerTitle: true,
      ),
      body:  
              controller.obx(
                onEmpty: const Center(child: Text(MessagesConstants.kNetworkNotAvailable)),
                   (state) {
                    return ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state!.length,
                        controller: controller.scroll,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              controller.navigateToDetailsScreen(controller.popularPeopleList[index]);
                            },
                            child: PopularPeopleCard(controller.popularPeopleList[index]),
                          );
                        },
                      );
                  }
                )
      
    );
  }
}
