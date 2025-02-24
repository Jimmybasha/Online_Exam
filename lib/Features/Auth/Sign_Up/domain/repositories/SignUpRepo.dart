

import 'package:online_exam/Core/ApiManager/ApiResult.dart';
import 'package:online_exam/Features/Auth/Sign_Up/data/models/UserSignUpModel.dart';

abstract class SignUpRepo{

  Future<ApiResult<UserSignUpModel>> signUp(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String rePassword,
      );
}