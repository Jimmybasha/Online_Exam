import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/domain/use_cases/check_answers_use_case.dart';

part 'check_answers_state.dart';

class CheckAnswersCubit extends Cubit<CheckAnswersState> {
  CheckAnswersCubit(this.checkAnswersUseCase) : super(CheckAnswersInitial());
  final CheckAnswersUseCase checkAnswersUseCase;

  Future<void> checkAnswers({required Map<String, dynamic> data}) async {
    emit(CheckAnswersLoading());
    var result = await checkAnswersUseCase.call(data: data);
    result.fold(
        (failure) =>
            emit(CheckAnswersFailure(errorMessage: failure.errorMessage)),
        (result) => emit(CheckAnswersSuccess(checkAnswerModel: result)));
  }
  
}
