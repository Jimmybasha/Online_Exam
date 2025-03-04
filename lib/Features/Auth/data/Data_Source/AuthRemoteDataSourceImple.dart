import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';

import 'package:online_exam/Features/Auth/data/Data_Source/AuthRemoteDataSource.dart';

import 'package:online_exam/Features/Auth/data/Models/user_model/user_model.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    var response = await apiManager.postData(
      endPoint: kLoginUserEndPoint,
      data: {"email": email, "password": password},
    );
    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }

  @override
  Future<Map<String, dynamic>> forgetPassword({required String email}) async {
    var response = await apiManager
        .postData(endPoint: kForgetPasswordEndPoint, data: {"email": email});
    return response.data;
  }

  @override
  Future<Map<String, dynamic>> verifyCode({required String resetCode})async {
  var response = await  apiManager.postData(endPoint: kVerifyCode, data: {
       "resetCode" : resetCode});
        return response.data;

  }
}
