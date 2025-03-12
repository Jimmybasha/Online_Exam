import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model/subjects_model.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_subjects_use_case.dart';

part 'get_all_subjects_state.dart';

class GetAllSubjectsCubit extends Cubit<GetAllSubjectsState> {
  GetAllSubjectsCubit(this.getAllSubjectsUseCase)
      : super(GetAllSubjectsInitial());
  final GetAllSubjectsUseCase getAllSubjectsUseCase;
  Future<void> getAllSubjects() async {
    emit(GetAllSubjectsLoading());
    var result = await getAllSubjectsUseCase.call();
    // log("in GetAllSubjectsCubit $result");
    result.fold((failure) {
      emit(GetAllSubjectsFailure(errorMessage: failure.errorMessage));
    }, (subject) {
      emit(GetAllSubjectsSuccess(subjectsModel: subject));
    });
  }
}
