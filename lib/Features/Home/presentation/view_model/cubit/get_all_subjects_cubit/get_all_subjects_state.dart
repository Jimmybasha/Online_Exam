part of 'get_all_subjects_cubit.dart';

sealed class GetAllSubjectsState extends Equatable {
  const GetAllSubjectsState();

  @override
  List<Object> get props => [];
}

final class GetAllSubjectsInitial extends GetAllSubjectsState {}

final class GetAllSubjectsLoading extends GetAllSubjectsState {}

final class GetAllSubjectsFailure extends GetAllSubjectsState {
  final String errorMessage;

  const GetAllSubjectsFailure({required this.errorMessage});
}

final class GetAllSubjectsSuccess extends GetAllSubjectsState {
  final SubjectsModel subjectsModel;

  const GetAllSubjectsSuccess({required this.subjectsModel});
}
