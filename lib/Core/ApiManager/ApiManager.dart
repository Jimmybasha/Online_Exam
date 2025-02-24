import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
<<<<<<< HEAD

import '../Constants/Constants.dart';

@singleton // Resolved to be singleton
class ApiManager{

  final Dio dio = Dio(
    BaseOptions(
    baseUrl: BASE_URL,
      headers: {'Content-Type': 'application/json'},
    )
  );

  Future<Response> getData({required String endPoint})async{
    var response = dio.get(endPoint);
    return response;
  }
  Future<Response> postData({required String endPoint,required Map<String, dynamic> data})async{
    var response = dio.post(endPoint,data: data );
    return response;
  }
=======

@singleton
@injectable
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://exam.elevateegy.com/api/v1/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Response> getRequest(String endpoint) async {
    Response response = await dio.get(endpoint);
    return response;
  }

  Future<Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await dio.post(endpoint, data: data);
    return response;
  }

>>>>>>> c4a13b224fec080ecdd9692b03dd4ea4328f5e3c
  Future<Response> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response.data;
  }
}
