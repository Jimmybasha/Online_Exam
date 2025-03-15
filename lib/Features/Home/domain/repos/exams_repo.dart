import 'package:dartz/dartz.dart';
import 'package:online_exam/Core/Errors/Failure.dart';

import '../../data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/all_exams_on_subjects_model.dart';

abstract class ExamsRepo {
  Future<Either<Failure, AllExamsOnSubjectsModel>> getAllExamsOnSubjects(
      {required String subjId});
}
