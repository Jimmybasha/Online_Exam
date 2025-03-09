
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Features/Profile/Profile/domain/use_cases/UpdatePasswordUseCase.dart';

import '../States/UpdatePasswordState.dart';

class UpdatePasswordPageViewModel extends Cubit<UpdatePasswordState>{
  UpdatePasswordUseCase updatePasswordUseCase;
  UpdatePasswordPageViewModel(this.updatePasswordUseCase):super(UpdatePasswordInitState());

  Future<void> updatePassword(String currentPassword , String newPassword)async{
    emit(UpdatePasswordLoadingState());
    var result = await updatePasswordUseCase.call(currentPassword, newPassword);
    result.fold((error) {
      emit(UpdatePasswordFailureState(error.errorMessage));
    }, (data) {
      emit(UpdatePasswordSuccessState(data));
    },
    );
  }


}