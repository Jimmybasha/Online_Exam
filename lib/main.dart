import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Features/Auth/Sign_Up/presentation/widgets/SignUpPage.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth= MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(screenWidth, screenHeight),
        builder:(_,child)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignUpPage(),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'),
          ],
        )
    ) ;


  }
}

