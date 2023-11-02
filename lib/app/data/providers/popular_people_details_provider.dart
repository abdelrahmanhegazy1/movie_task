import 'package:get/get.dart';
import 'package:movie_task/app/core/values/api_paramater_constants.dart';
import 'package:movie_task/app/core/values/app_constants.dart';
import 'package:movie_task/app/core/values/endpoints_constants.dart';
import 'package:movie_task/app/core/values/messages_constanst.dart';
import 'package:movie_task/app/data/exceptions/network_exception.dart';
import 'package:movie_task/app/data/models/people_details_model.dart';
import 'package:movie_task/app/data/models/people_images_model.dart';
import 'package:movie_task/app/data/providers/app_provider.dart';
import 'package:http/http.dart' as http;

class PopularPeopleDetailsProvider extends AppProvider{

    Future<PeopleImages?> getPopularPeopleImages({required int personId}) async{
    Response result;
    result = await get(EndpointConstants.kGetPopularPeopleDetails+personId.toString()+EndpointConstants.kImages,query: {
      ApiParamaterKeys.apiKey: AppConstants.kApiKey
    },
    decoder: (data) {
      return PeopleImages.fromJson(data);
    },
    );
    if (!result.isOk){
      throw NetworkException(MessagesConstants.kNetworkNotAvailable);
    }
    return result.body;
  }

   Future<PeopleDetails?> getPopularPeopleDetails({required int personId}) async{
    Response result;
    result = await get(EndpointConstants.kGetPopularPeopleDetails+personId.toString(),query: {
      ApiParamaterKeys.apiKey: AppConstants.kApiKey
    },
    decoder: (data) {
      return PeopleDetails.fromJson(data);
    },
    );
    if (!result.isOk){
      throw NetworkException(MessagesConstants.kNetworkNotAvailable);
    }
    return result.body;
  }

   Future<http.Response> downloadPhoto({required String imageUrl}) async{
    http.Response result;
    result = await http.get(Uri.parse( imageUrl));
    if (result.statusCode!=200){
      throw NetworkException(MessagesConstants.kNetworkNotAvailable);
    }
    return result;
  }
}