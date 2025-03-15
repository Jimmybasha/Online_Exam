part of 'get_all_questions_on_exam_view_model_cubit.dart';

sealed class GetAllQuestionsOnExamViewModelState extends Equatable {
  const GetAllQuestionsOnExamViewModelState();

  @override
  List<Object> get props => [];
}

class GetAllQuestionsOnExamInitState
    extends GetAllQuestionsOnExamViewModelState {}

class GetAllQuestionsOnExamLoadingState
    extends GetAllQuestionsOnExamViewModelState {}

class GetAllQuestionsOnExamFailureState
    extends GetAllQuestionsOnExamViewModelState {
  final String error;
  const GetAllQuestionsOnExamFailureState(this.error);
}

class GetAllQuestionsOnExamSuccessState
    extends GetAllQuestionsOnExamViewModelState {
  final AllQuestionsOnExamModel questionExamModel;
  const GetAllQuestionsOnExamSuccessState({required this.questionExamModel});
}
