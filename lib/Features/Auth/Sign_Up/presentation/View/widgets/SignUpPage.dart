import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/AppStyles.dart';
import 'SignUpScreenBody.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String id = "SignUpPageRoute";


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
