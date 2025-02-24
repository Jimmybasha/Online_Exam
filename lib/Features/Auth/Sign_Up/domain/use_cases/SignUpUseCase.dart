
import 'package:injectable/injectable.dart';
import 'package:online_exam/Features/Auth/Sign_Up/data/models/UserSignUpModel.dart';
import 'package:online_exam/Features/Auth/Sign_Up/domain/repositories/SignUpRepo.dart';

import '../../../../../Core/ApiManager/ApiResult.dart';

@injectable
class SignUpUseCase{
  SignUpRepo signUpRepo;
  SignUpUseCase(this.signUpRepo);

  Future<ApiResult<UserSignUpModel>> call(
      String username,
      String firstName,
      String lastName,
      String email,
      String password,
      String phone,
      String rePassword,
      )async{
    return await signUpRepo.signUp(username, firstName, lastName, email, password, phone, rePassword);
  }

}