import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/ForgetPasswordUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordViewModel.dart';
import 'package:online_exam/Features/Auth/presentation/view/widgets/ForgetPasswordScreenBody.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const String id = 'ForgetPassword';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //create attribute it needs the viewModel to assign the viewModel Files and the usecase
      //Creates it from the getIt.get()
      create:(context) => ForgetPasswordViewModel(getIt.get<ForgetPasswordUseCase>()) ,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            title: 'Password',
            leadingVisibility: true,
          ),
        ),
        body: ForgetPasswordScreenBody(),
      ),
    );
  }
}
