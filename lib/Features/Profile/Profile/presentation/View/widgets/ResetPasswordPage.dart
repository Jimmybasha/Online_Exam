import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model/user_model.dart';
import 'package:online_exam/Features/Profile/Profile/domain/use_cases/UpdatePasswordUseCase.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ResetPasswordPageBody.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/Cubit/UpdatePasswordPageViewModel.dart';

import '../../../../../../Core/widgets/custom_app_bar.dart';

class ResetPasswordPage extends StatelessWidget {
  static const String id = "resetPasswordPageView";
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as UserModel;
    UserModel user = args;
    return BlocProvider(
      create: (context) =>
          UpdatePasswordPageViewModel(getIt.get<UpdatePasswordUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            title: 'Reset Password',
            leadingVisibility: true,
          ),
        ),
        body: ResetPasswordPageBody(userModel: user,),
      ),
    );
  }
}
