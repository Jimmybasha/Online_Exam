import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
@Singleton()
@injectable
class ApiManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://exam.elevateegy.com/api/v1/',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Either<Failure, Response>> getRequest(String endpoint) async {
    try {
      final response = await dio.get(endpoint);
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Response>> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, Response>> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await dio.put(endpoint, data: data);
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, dynamic>> deleteRequest(String endpoint) async {
    try {
      final response = await dio.delete(endpoint);
      return Right(response.data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
