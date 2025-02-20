import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';


import 'package:online_exam/Features/Auth/data/Data_Source/AuthRemoteDataSource.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model.dart';

@Injectable(as: AuthRemoteDataSourceImpl)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<UserModel> loginUser(
      {required String email, required String password}) async {
    var response = await apiManager.postRequest(
        kLoginUserEndPoint, {"email": email, "password": password});
    UserModel userModel = UserModel.fromJson(response.data);
    return userModel;
  }
}
