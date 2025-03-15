import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/domain/repos/check_answers_repo.dart';

@injectable
class CheckAnswersUseCase {
  final CheckAnswersRepo checkAnswersRepo;

  CheckAnswersUseCase({required this.checkAnswersRepo});
  Future<Either<Failure, CheckAnswerModel>> call(
      {required Map<String, dynamic> data}) async {
 return await  checkAnswersRepo.checkAnswers(data: data);
  }
}
