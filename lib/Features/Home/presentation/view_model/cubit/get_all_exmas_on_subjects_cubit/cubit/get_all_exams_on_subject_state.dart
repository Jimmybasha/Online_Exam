part of 'get_all_exams_on_subject_cubit.dart';

sealed class GetAllExamsOnSubjectState extends Equatable {
  const GetAllExamsOnSubjectState();

  @override
  List<Object> get props => [];
}

final class GetAllExamsOnSubjectInitial extends GetAllExamsOnSubjectState {}

final class GetAllExamsOnSubjectLoading extends GetAllExamsOnSubjectState {}

final class GetAllExamsOnSubjectSuccess extends GetAllExamsOnSubjectState {
  final AllExamsOnSubjectsModel allExamsOnSubjectsModel;

  const GetAllExamsOnSubjectSuccess({required this.allExamsOnSubjectsModel});
}

final class GetAllExamsOnSubjectFailure extends GetAllExamsOnSubjectState {
  final String errorMessage;

  const GetAllExamsOnSubjectFailure({required this.errorMessage});
}
