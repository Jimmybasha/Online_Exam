
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/Sign_Up/data/data_sources/Remote/SignUpDataSource.dart';
import 'package:online_exam/Features/Auth/Sign_Up/domain/repositories/SignUpRepo.dart';
import '../../../../../Core/ApiManager/ApiResult.dart';
import '../models/UserSignUpModel.dart';

@Injectable(as:  SignUpRepo)
class SignUpRepoImpl implements SignUpRepo{
  @override

  SignUpDataSource signUpDataSource;
  SignUpRepoImpl(this.signUpDataSource);

  Future<ApiResult<UserSignUpModel>> signUp(
       String username,
       String firstName,
       String lastName,
       String email,
       String password,
       String phone,
       String rePassword,
      ) async{
    try {
      return await signUpDataSource.signUp(
    username: username,
    firstName: firstName,
    lastName: lastName,
    email: email,
    password: password,
    rePassword: rePassword,
    phone: phone,
    );
    }on DioException catch (exception) {
      return ErrorApiResult(exception);
    }

  }

}