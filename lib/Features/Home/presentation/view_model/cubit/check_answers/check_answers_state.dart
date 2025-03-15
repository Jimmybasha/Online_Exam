part of 'check_answers_cubit.dart';

sealed class CheckAnswersState extends Equatable {
  const CheckAnswersState();

  @override
  List<Object> get props => [];
}

final class CheckAnswersInitial extends CheckAnswersState {}

final class CheckAnswersLoading extends CheckAnswersState {}

final class CheckAnswersSuccess extends CheckAnswersState {
  final CheckAnswerModel checkAnswerModel;

 const CheckAnswersSuccess({required this.checkAnswerModel});
}

final class CheckAnswersFailure extends CheckAnswersState {
  final String errorMessage;

 const CheckAnswersFailure({required this.errorMessage});
}
