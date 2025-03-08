import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model/subjects_model.dart';

abstract class SubjectsRemoteDataSource {
  Future<SubjectsModel> getAllSubjects();
}
