import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/all_exams_on_subjects_model.dart';

abstract class ExamRemoteDataSource {
  Future<AllExamsOnSubjectsModel> getAllExamsOnSubjects(
      {required String subjId});
}
