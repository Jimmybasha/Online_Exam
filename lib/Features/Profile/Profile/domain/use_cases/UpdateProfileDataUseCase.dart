
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Profile/Profile/domain/repositories/ProfileRepo.dart';


@injectable
class UpdateProfileDataUseCase{
  ProfileRepo profileRepo;
  UpdateProfileDataUseCase(this.profileRepo);

  Future<Either<Failure,Map<String,dynamic>>> call(Map<String,dynamic> user)async{
    return await profileRepo.updateProfile(user);
  }
}