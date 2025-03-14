import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/all_questions_on_exam_model.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/questions_model.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_questions_on_exam_use_case.dart';


part 'get_all_questions_on_exam_view_model_state.dart';

class GetAllQuestionsOnExamViewModelCubit extends Cubit<GetAllQuestionsOnExamViewModelState> {

  GetAllQuestionsOnExamUseCase getAllQuestionsOnExamUseCase;





  GetAllQuestionsOnExamViewModelCubit
      (this.getAllQuestionsOnExamUseCase)
      :
        super(GetAllQuestionsOnExamInitState());

  Future<void> getAllQuestions({required String examId})async{
    emit(GetAllQuestionsOnExamLoadingState());

    var response = await getAllQuestionsOnExamUseCase.call(examId: examId);

    response.fold(
          (error) {
      emit(GetAllQuestionsOnExamFailureState(error.errorMessage)
      );

    },
          (questions) {
      emit(GetAllQuestionsOnExamSuccessState(questionExamModel: questions));
    },
    );
  }

}
