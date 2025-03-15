import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/ResetPasswordUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ResetPasswordCubit/ResetPasswordViewModel.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/ResetPassworScreenBody.dart';

import '../../../../Core/widgets/custom_app_bar.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String id = "ResetPasswordScreen";
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  String? email;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    print(
        "📥 Received arguments in didChangeDependencies in the ResetPassword Screen: $args");

    if (args is String) {
      final receivedEmail = args;
      if (receivedEmail.isNotEmpty) {
        setState(() {
          email = receivedEmail;
        });
        print("✅ Email received in ResetPassScreen: $email");
      } else {
        print("❌ Invalid email argument: $receivedEmail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPasswordViewModel(getIt.get<ResetPasswordUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            title: 'Password',
            leadingVisibility: true,
          ),
        ),
        body: ResetPasswordScreenBody(email: email),
      ),
    );
  }
}
