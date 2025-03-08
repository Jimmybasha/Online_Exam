import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Errors/Failure.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/get_all_exams_on_subjects_model.dart';
import 'package:online_exam/Features/Home/domain/repos/exams_repo.dart';

@injectable
class GetAllExamsOnSubjectsUseCase {
  final ExamsRepo examsRepo;

  GetAllExamsOnSubjectsUseCase({required this.examsRepo});

  Future<Either<Failure, AllExamsOnSubjectsModel>> call(
      {required String subjId}) async {
    return await examsRepo.getAllExamsOnSubjects(subjId: subjId);
  }
}
