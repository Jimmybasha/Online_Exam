import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/VerifyCodeUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/view/widgets/EmailVerificationScreenBody.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/EmailVerificationCubit/EmailVerificationViewModel.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});
  static const String id = 'EmailVerificationView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailVerificationViewModel(getIt.get<VerifyCodeUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            title: 'Password',
            leadingVisibility: true,
          ),
        ),
        body: EmailVerificationScreenBody(),
      ),
    );
  }
}
