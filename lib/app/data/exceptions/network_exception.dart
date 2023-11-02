import 'package:get/get.dart';
import 'package:movie_task/app/data/exceptions/app_exception.dart';

class NetworkException extends AppException{
  String? errorMessage;
  NetworkException(this.errorMessage) : super(errorMessage);
}