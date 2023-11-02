import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:movie_task/app/core/values/app_constants.dart';

class AppProvider extends GetConnect {
  final RxBool _networkUnAvailable = false.obs;
  @override
  void onInit() {
    httpClient.baseUrl = AppConstants.kBaseURL;
    httpClient.maxAuthRetries = 1;
    httpClient.followRedirects = true;
    httpClient.timeout = const Duration(seconds: 5);
    super.onInit();
  }
}