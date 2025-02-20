import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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
