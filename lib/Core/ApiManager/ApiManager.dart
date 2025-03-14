import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../Constants/Constants.dart';
import '../utils/Services/secure_storage.dart';

@singleton // Resolved to be singleton
class ApiManager {
  final Dio dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
      headers: {
      'Content-Type': 'application/json',
      },
    )
  );

  /// Method to set token dynamically
  Future<void> setToken() async {
    String? token = await SecureStorageService().readSecureData(kUserToken);
    if (token != null && token.isNotEmpty) {
      dio.options.headers['token'] = token; // Update headers
    }
  }

  Future<Response> getData({required String endPoint,Map<String,dynamic>? params})async{
    await setToken();
    var response = dio.get(
        endPoint,
      queryParameters: params
    );
    return response;
  }
  Future<Response> postData({required String endPoint,required Map<String, dynamic> data})async{
    await setToken();
    var response = dio.post(endPoint,data: data );
    return response;
  }

  Future<Response> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    await setToken();
    final response = await dio.put(endpoint, data: data);
    return response;
  }

  //Added Patch
  Future<Response> patchRequest(
      String endpoint, Map<String, dynamic> data) async {
    await setToken();
    final response = await dio.patch(endpoint, data: data);
    return response;
  }

  Future<Response> deleteRequest(String endpoint) async {
    await setToken();
    final response = await dio.delete(endpoint);
    return response.data;
  }
}
