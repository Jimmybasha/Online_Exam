import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/get_all_questions_on_exam/get_all_questions_on_exam_model.dart';
import 'package:online_exam/Features/Home/domain/repos/questions_repo.dart';

@injectable
class GetAllQuestionsOnExamUseCase {
  final QuestionsRepo questionsRepo;

  GetAllQuestionsOnExamUseCase({required this.questionsRepo});
  Future<Either<Failure, AllQuestionsOnExamModel>> call(
      {required String examId}) async {
    return await questionsRepo.getAllQuestionsOnExam(examId: examId);
  }
}
