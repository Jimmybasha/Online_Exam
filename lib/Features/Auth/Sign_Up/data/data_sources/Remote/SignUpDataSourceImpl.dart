
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/ApiManager/ApiResult.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Features/Auth/Sign_Up/data/data_sources/Remote/SignUpDataSource.dart';
import 'package:online_exam/Features/Auth/Sign_Up/data/models/UserSignUpModel.dart';
@Injectable(as: ISignUpDataSource)
class AuthRemoteDataSourceImpl implements ISignUpDataSource{

  ApiManager apiManager;
  AuthRemoteDataSourceImpl(this.apiManager);

  @override
  Future<ApiResult<UserSignUpModel>> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async{
   try{
     final response = await apiManager.postData(
         endPoint: SIGNUP_URL,
         data:{
       "username": username,
       "firstName": firstName,
       "lastName": lastName,
       "email": email,
       "password": password,
       "rePassword":rePassword,
       "phone": phone,
     });
     return SuccessApiResult(UserSignUpModel.fromJson(response?.data));

   }on DioException catch(exc){
     return ErrorApiResult(exc);
   }
  }

}