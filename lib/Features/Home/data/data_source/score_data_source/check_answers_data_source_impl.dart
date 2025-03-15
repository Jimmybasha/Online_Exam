import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/ApiManager/ApiManager.dart';
import 'package:online_exam/Core/Constants/Constants.dart';

import 'package:online_exam/Features/Home/data/data_source/score_data_source/check_answers_remote_data_source.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';

@Injectable(as: CheckAnswersDataSource)
class CheckAnswersDataSourceImpl implements CheckAnswersDataSource {
  final ApiManager apiManager;

  CheckAnswersDataSourceImpl({required this.apiManager});

  @override
  Future<CheckAnswerModel> checkAnswers(
      {required Map<String, dynamic> data}) async {
  var response = await apiManager.postData(endPoint: kCheckAnswersEndPoint, data: data);
  return CheckAnswerModel.fromJson(response.data);
  }
}
