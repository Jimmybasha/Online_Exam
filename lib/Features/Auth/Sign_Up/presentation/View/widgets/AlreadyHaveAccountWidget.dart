
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Login/presentation/view/LoginScreen.dart';

class AlreadyHaveAccountWidget extends StatelessWidget{
  final VoidCallback onLoginPressed;
  final String message;
  final String loginText;


  AlreadyHaveAccountWidget({
  Key? key,
  required this.onLoginPressed,
  this.message = "Already have an account?",
  this.loginText = "Login"
  });
  @override
  Widget build(BuildContext context) {


    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
         TextButton(
              onPressed: onLoginPressed,
              child: Text(loginText,
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              ),
            )
        ]
    );
  }

}