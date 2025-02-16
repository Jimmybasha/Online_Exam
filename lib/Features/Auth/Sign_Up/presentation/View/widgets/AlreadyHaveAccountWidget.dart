
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../Login/presentation/view/LoginScreen.dart';

class AlreadyHaveAccountWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(
            onPressed: (){

            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(LoginScreen.id);
              },
              child: Text("Login",
                style: TextStyle(
                    decoration: TextDecoration.underline
                ),
              ),
            )
        ),
      ],
    );

  }

}