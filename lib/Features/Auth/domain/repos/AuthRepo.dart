import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model.dart';
@Injectable()
abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({required String email, required String password});
}
