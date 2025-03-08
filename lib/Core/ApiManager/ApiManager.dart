import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../Constants/Constants.dart';

@singleton // Resolved to be singleton
class ApiManager {
  final Dio dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    headers: {'Content-Type': 'application/json'},
  ));

  Future<Response> getData(
      {required String endPoint, required String token}) async {
    var response =
        dio.get(endPoint, options: Options(headers: {'token': token}));
    return response;
  }

  Future<Response> postData(
      {required String endPoint, required Map<String, dynamic> data}) async {
    var response = dio.post(endPoint, data: data);
    return response;
  }

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
