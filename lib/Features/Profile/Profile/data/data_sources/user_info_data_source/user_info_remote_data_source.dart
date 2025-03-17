import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';

abstract class UserInfoRemoteDataSource {
  Future<UserInfoModel> getUserData();
}