import 'package:online_exam/Features/Auth/data/Models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> loginUser(
      {required String email, required String password});
}
