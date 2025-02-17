import '../../../../../../Core/ApiManager/ApiResult.dart';
import '../../models/UserSignUpModel.dart';

abstract  class ISignUpDataSource{

  Future<ApiResult<UserSignUpModel>> signUp({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,});
}