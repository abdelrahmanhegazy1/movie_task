import 'package:get/get.dart';
import 'package:movie_task/app/core/values/api_paramater_constants.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/endpoints_constants.dart';
import 'package:movie_task/app/core/values/messages_constanst.dart';
import 'package:movie_task/app/data/exceptions/network_exception.dart';
import 'package:movie_task/app/data/models/popular_people_model.dart';
import 'package:movie_task/app/data/providers/app_provider.dart';

class HomeProvider extends AppProvider {

  Future<PopularPeopleResponse?> getPopularPeople({required int page}) async{
    Response result;
    result = await get(EndpointConstants.kGetPopularPeople,query: {
      ApiParamaterKeys.apiKey: AppConstants.kApiKey,
      ApiParamaterKeys.page : page.toString()
    },
    decoder: (data) {
      return PopularPeopleResponse.fromJson(data);
    },
    );
    if (!result.isOk){
      throw NetworkException(MessagesConstants.kNetworkNotAvailable);
    }
    return result.body;
  }
}