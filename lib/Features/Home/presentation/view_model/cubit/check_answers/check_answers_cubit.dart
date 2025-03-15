import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/domain/use_cases/check_answers_use_case.dart';

part 'check_answers_state.dart';

class CheckAnswersCubit extends Cubit<CheckAnswersState> {
  final CheckAnswersUseCase _checkAnswersUseCase;

  CheckAnswersCubit(this._checkAnswersUseCase) : super(CheckAnswersInitial());

  CheckAnswerModel? scoreModel;

  Future<void> checkAnswers(List<Map<String, String>> answerList) async {
    emit(CheckAnswersLoading());

    try {
      final Map<String, dynamic> requestBody = {
        "answers": answerList,
      };

      final result = await _checkAnswersUseCase.call(data: requestBody);

      result.fold(
              (failure) => emit(CheckAnswersFailure(errorMessage: failure.errorMessage)),
              (scoreModel) {
            this.scoreModel = scoreModel;
            emit(CheckAnswersSuccess(checkAnswerModel: scoreModel));
          }
      );
    } catch (e) {
      emit(CheckAnswersFailure(errorMessage: e.toString()));
    }
  }
}
  

