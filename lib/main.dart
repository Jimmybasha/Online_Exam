import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/utils/app_routes.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/login_screen.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: Size(screenWidth, screenHight),
        splitScreenMode: true,
        builder: (context, child) {
          ScreenUtil.init(context);
          return MaterialApp(
            theme: ThemeData(fontFamily: GoogleFonts.inter().fontFamily),
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'), // English
              Locale('ar'),
            ],
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            home: LoginScreen(),
          );
        });
  }
}
