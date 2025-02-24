import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errorMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errorMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errorMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errorMessage: 'Bad SSL certificate error');
      case DioExceptionType.badResponse:
<<<<<<< HEAD
            // here i need to check on response and statuscode
=======
        // here i need to check on response and statuscode
>>>>>>> c4a13b224fec080ecdd9692b03dd4ea4328f5e3c
        return ServerFailure.fromResponse(
            dioExcep.response!.statusCode!, dioExcep.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errorMessage: 'Request to ApiServer cancelled');
      case DioExceptionType.connectionError:
        return ServerFailure(errorMessage: 'There is no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            errorMessage: 'UnExcepted error , Please try again');
      default:
        return ServerFailure(
            errorMessage: 'Oops there is an error , Please try later');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, jsonData) {
<<<<<<< HEAD
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      if (jsonData["message"] != null && jsonData["message"].toString().contains("fails to match the required pattern")) {
        return ServerFailure(errorMessage: "Password must contain at least:\n - 8 characters\n - One uppercase letter\n - One lowercase letter\n - One number\n - One special character.");
      }
      return ServerFailure(errorMessage: jsonData["message"]);
      case 404:
        return ServerFailure(errorMessage: 'Requested resource not found.');
      case 409:
        return ServerFailure(errorMessage: 'Account Already Exists.');
      case 500:
        return ServerFailure(errorMessage: 'Internal server error. Please try again later.');
      default:
        return ServerFailure(errorMessage: 'Unexpected error. Status Code: $statusCode');
=======
    if (statusCode == 400 || statusCode == 403) {
      return ServerFailure(errorMessage: jsonData["message"]);
    } else if (statusCode == 401) {
      return ServerFailure(errorMessage: 'incorrect email or password');
    } else if (statusCode == 500) {
      return ServerFailure(
          errorMessage: ' Internal Server Error , Please try later');
    } else if (statusCode == 404) {
      return ServerFailure(
          errorMessage: ' Your request not found , Please try later');
      //in this case i don't receive response aslan
    } else {
      return ServerFailure(
          errorMessage: 'Oops there is an error , Please try later');
>>>>>>> c4a13b224fec080ecdd9692b03dd4ea4328f5e3c
    }
  }
}
