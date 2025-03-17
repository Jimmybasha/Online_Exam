// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lottie/lottie.dart';

// import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';

// import 'package:online_exam/Features/Home/presentation/view/main_screen.dart';
// import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/Cubit/user_info_cubit/user_info_cubit.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//   static const String id = "SplashScreen";

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<UserInfoCubit>().getUserData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<UserInfoCubit, UserInfoState>(
//       listener: (context, state) {
//         if (state is UserInfoSuccess) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             MainScreen.id,
//             (route) => false,
//             arguments: state.userInfoModel,
//           );
//         } else if (state is UserInfoFailure) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             LoginScreen.id,
//             (route) => false,
//           );
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Lottie.asset("assets/images/splash_image.json"),
//         ),
//       ),
//     );
//   }
// }
