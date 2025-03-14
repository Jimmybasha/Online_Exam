import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Features/Home/data/data_source/questions_data_source/questions_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/all_questions_on_exam_model.dart';

@Injectable(as: QuestionsRemoteDataSource)
class QuestionsRemoteDataSourceImpl implements QuestionsRemoteDataSource {
  final ApiManager apiManager;

  QuestionsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<AllQuestionsOnExamModel> getAllQuestionsOnExam(
      {required String examId}) async {
    var response = await apiManager.getData(
        endPoint: 'questions?exam=$examId');
    AllQuestionsOnExamModel allQuestionsOnExamModel =
        AllQuestionsOnExamModel.fromJson(response.data);
    return allQuestionsOnExamModel;
  }
}
