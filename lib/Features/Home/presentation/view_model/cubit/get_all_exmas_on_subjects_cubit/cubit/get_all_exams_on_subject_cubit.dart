import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_exams_on_subjects_use_case.dart';

import '../../../../../data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/all_exams_on_subjects_model.dart';

part 'get_all_exams_on_subject_state.dart';

class GetAllExamsOnSubjectCubit extends Cubit<GetAllExamsOnSubjectState> {
  GetAllExamsOnSubjectCubit(this.allExamsOnSubjectsUseCase)
      : super(GetAllExamsOnSubjectInitial());
  final GetAllExamsOnSubjectsUseCase allExamsOnSubjectsUseCase;

  Future<void> getAllExamsOnSubjects({required String subjId}) async {
    emit(GetAllExamsOnSubjectLoading());
    var result = await allExamsOnSubjectsUseCase.call(subjId: subjId);
    result.fold((failure) {
      emit(GetAllExamsOnSubjectFailure(errorMessage: failure.errorMessage));
    }, (exams) {
      emit(GetAllExamsOnSubjectSuccess(allExamsOnSubjectsModel: exams));
    });
  }
}
