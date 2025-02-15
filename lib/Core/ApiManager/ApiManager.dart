import 'package:dio/dio.dart';

import '../Constants/Constants.dart';

class ApiManager{


  final Dio dio = Dio(
    BaseOptions(
    baseUrl: BASE_URL
    )
  );

  Future<Response>? getData({required String endPoint})async{
    var response = dio.get(endPoint);
    return response;
  }

}