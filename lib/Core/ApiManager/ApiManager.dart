import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../Constants/Constants.dart';
@injectable
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
  Future<Response>? postData({required String endPoint,required Map<String, dynamic> data})async{
    var response = dio.post(endPoint,data: data );
    return response;
  }

}