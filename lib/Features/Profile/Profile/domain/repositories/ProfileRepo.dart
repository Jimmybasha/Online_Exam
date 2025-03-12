import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

import 'package:online_exam/Features/Auth/data/Models/user_model/user.dart';

abstract class ProfileRepo{

  Future<Either<Failure,Map<String,dynamic>>> updateProfile(Map<String,dynamic> userData);

}