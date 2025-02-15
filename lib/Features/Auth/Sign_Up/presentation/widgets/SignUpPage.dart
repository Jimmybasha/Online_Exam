import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/AppStyles.dart';
import 'package:online_exam/Core/Constants/Validator.dart';
import 'package:online_exam/Core/Reusable_Widgets/CustomTextField.dart';
import 'package:online_exam/Features/Auth/Sign_Up/presentation/widgets/SignUpScreenBody.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style:AppStyles.pageTitle
          ),
      ),
      body:  SignUpScreenBody()
    );
  }
}
