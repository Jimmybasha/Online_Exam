import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Auth/presentation/view/widgets/EmailVerificationScreen.dart';
import 'package:online_exam/Features/Home/presentation/view/all_exams_by_subject_screen.dart';

import 'package:online_exam/Features/Home/presentation/view/home_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/main_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_details_view.dart';

import '../../Features/Auth/Sign_Up/presentation/View/widgets/SignUpPage.dart';
import '../../Features/Home/presentation/view/questions_screen.dart';
import '../../Features/Profile/Profile/presentation/View/widgets/ProfilePage.dart';
import '../../Features/Profile/Profile/presentation/View/widgets/ResetPasswordPage.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ForgetPasswordScreen.id:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case EmailVerificationScreen.id:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen());
      case SignUpPage.id:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ProfilePage.id:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case ResetPasswordPage.id:
        return MaterialPageRoute(builder: (_) => const ResetPasswordPage());
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case MainScreen.id:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AllExamsBySubjectScreen.id:
        return MaterialPageRoute(
            builder: (_) => AllExamsBySubjectScreen(), settings: settings);
      case QuestionsScreen.id:
        return MaterialPageRoute(
            builder: (_) => QuestionsScreen(), settings: settings);
      case ExamDetailsView.id:
        return MaterialPageRoute(
            builder: (_) => ExamDetailsView(), settings: settings);
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text("Page Not Found")),
      ),
    );
  }
}
