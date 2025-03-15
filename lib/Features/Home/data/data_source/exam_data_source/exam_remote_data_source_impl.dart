import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Features/Home/data/data_source/exam_data_source/exam_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/all_exams_on_subjects_model.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  final ApiManager apiManager;

  ExamRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<AllExamsOnSubjectsModel> getAllExamsOnSubjects(
      {required String subjId}) async {
    var response = await apiManager.getData(endPoint: 'exams?subject=$subjId');
    log('in ExamRemoteDataSourceImpl ${response.data}');
    AllExamsOnSubjectsModel allExamsOnSubjectsModel =
        AllExamsOnSubjectsModel.fromJson(response.data);
    return allExamsOnSubjectsModel;
  }
}
