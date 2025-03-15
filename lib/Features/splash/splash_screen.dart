import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/utils/Services/secure_storage.dart';
import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Home/presentation/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String id = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 5),
      () async {
        String? token = await SecureStorageService().readSecureData(kUserToken);
        if (token != null) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            MainScreen.id,
            (route) => false,
          );
        } else {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.id,
            (route) => false,
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(child: Lottie.asset("assets/images/splash_image.json")),
    );
  }
}
