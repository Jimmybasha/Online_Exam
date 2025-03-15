import 'package:flutter/material.dart';
import 'package:online_exam/Features/Auth/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Auth/presentation/view/EmailVerificationScreen.dart';
import 'package:online_exam/Features/Home/presentation/view/all_exams_by_subject_screen.dart';

import 'package:online_exam/Features/Home/presentation/view/home_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/main_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_details_view.dart';
import 'package:online_exam/Features/splash/splash_screen.dart';

import '../../Features/Auth/Sign_Up/presentation/View/widgets/SignUpPage.dart';
import '../../Features/Auth/presentation/view/ResetPassword.dart';
import '../../Features/Auth/data/Models/user_model/user_model.dart';
import '../../Features/Home/presentation/view/ResultScreen.dart';
import '../../Features/Home/presentation/view/score_screen.dart';
import '../../Features/Home/presentation/view/questions_screen.dart';
import '../../Features/Profile/Profile/presentation/View/widgets/ProfilePage.dart';
import '../../Features/Profile/Profile/presentation/View/widgets/ResetPasswordPage.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ForgetPasswordScreen.id:
        return MaterialPageRoute(
            builder: (_) => const ForgetPasswordScreen(), settings: settings);
      case EmailVerificationScreen.id:
        return MaterialPageRoute(
            builder: (_) => const EmailVerificationScreen(),
            settings: settings);
      case SignUpPage.id:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ProfilePage.id:
        // Extract the arguments (UserModel) from settings
        final user = settings.arguments as UserModel?;
        if (user == null) {
          return _errorRoute(); // Handle missing arguments gracefully
        }
        return MaterialPageRoute(
            builder: (_) => ProfilePage(user: user.user), settings: settings);
      case ResetPasswordPage.id:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordPage(), settings: settings);

      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case MainScreen.id:
        return MaterialPageRoute(
            builder: (_) => const MainScreen(), settings: settings);
      case ResetPasswordScreen.id:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordScreen(), settings: settings);
      case ResultScreen.id:
        return MaterialPageRoute(
            builder: (_) => const ResultScreen(), settings: settings);
      case AllExamsBySubjectScreen.id:
        return MaterialPageRoute(
            builder: (_) => AllExamsBySubjectScreen(), settings: settings);
      case QuestionsScreen.id:
        return MaterialPageRoute(
            builder: (_) => QuestionsScreen(), settings: settings);
      case ExamDetailsView.id:
        return MaterialPageRoute(
            builder: (_) => ExamDetailsView(), settings: settings);
      case ScoreScreen.id:
        return MaterialPageRoute(
            builder: (_) => ScoreScreen(), settings: settings);
            case SplashScreen.id:
        return MaterialPageRoute(
            builder: (_) => SplashScreen(), settings: settings);
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
