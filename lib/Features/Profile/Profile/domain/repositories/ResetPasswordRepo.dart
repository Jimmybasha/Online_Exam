
import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

abstract class ResetPasswordRepo{

  Future<Either<Failure,Map<String,dynamic>>> resetPassword(Map<String,dynamic> data);

}