import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';

abstract class UserInfoRepo {
  Future<Either<Failure, UserInfoModel>> getUserData();
}
