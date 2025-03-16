import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/user_info_repo.dart';

@injectable
class UserInfoUseCase {
  final UserInfoRepo userInfoRepo;

  UserInfoUseCase({required this.userInfoRepo});

  Future<Either<Failure, UserInfoModel>> call() async {
    return await userInfoRepo.getUserData();
  }
}