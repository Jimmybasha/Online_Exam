
import 'dart:developer';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Features/Home/data/data_source/questions_data_source/questions_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/all_questions_on_exam_model.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/questions_model.dart';


@Injectable(as: QuestionsRemoteDataSource)
class QuestionsRemoteDataSourceImpl implements QuestionsRemoteDataSource {
  final ApiManager apiManager;

  QuestionsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<AllQuestionsOnExamModel> getAllQuestionsOnExam(
      {required String examId}) async {

    var response = await apiManager.getData(
        endPoint: 'questions',
        params: {
          'examId':examId
        }
    );

     List<QuestionModel> allQuestionsOnExamModel = (response.data['questions'] as List)
        .map((question) => QuestionModel.fromJson(question))
        .toList();

     log("The Question from the QuestionRemoDataSourceImpl ${allQuestionsOnExamModel[0].question}");
    return AllQuestionsOnExamModel(questions: allQuestionsOnExamModel);



  }
}
