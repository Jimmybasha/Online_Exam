import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

abstract class ProfileRepo {
  Future<Either<Failure, Map<String, dynamic>>> updateProfile(
      Map<String, dynamic> userData);
}
