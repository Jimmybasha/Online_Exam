import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/ForgetPasswordUseCase.dart';
import 'package:online_exam/Features/Auth/domain/UseCase/VerifyCodeUseCase.dart';
import 'package:online_exam/Features/Auth/presentation/view/widgets/EmailVerificationScreenBody.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/EmailVerificationCubit/EmailVerificationViewModel.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});
  static const String id = 'EmailVerificationView';


  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  String? email;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    print("📥 Received arguments in didChangeDependencies: $args");

    if (args is Map<String, dynamic>) {
      final receivedEmail = args['email'];
      if (receivedEmail != null && receivedEmail is String && receivedEmail.isNotEmpty) {
        setState(() {
          email = receivedEmail;
        });
        print("✅ Email received in EmailVerificationScreen: $email");
      } else {
        print("❌ Invalid email argument: $receivedEmail");
      }
    } else {
      print("❌ Email argument not found or invalid: $args");
    }
  }


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
        body: EmailVerificationScreenBody(email: email??"not found",),
      ),
    );
  }
}
