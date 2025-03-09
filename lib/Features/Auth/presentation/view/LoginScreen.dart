import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/LoginUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/login_cubit.dart';

import 'widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "loginScreenPage";
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<LoginUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHight.h),
          child: CustomAppBar(
            title: 'Login',
            leadingVisibility: false,
          ),
        ),
        body: LoginScreenBody(),
      ),
    );
  }
}
