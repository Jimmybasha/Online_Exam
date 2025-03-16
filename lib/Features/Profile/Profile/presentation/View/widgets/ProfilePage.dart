import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Auth/data/Models/user_model/user.dart';
import 'package:online_exam/Features/Profile/Profile/data/models/user_info_model/user_info_model/user_info_model.dart';
import 'package:online_exam/Features/Profile/Profile/domain/use_cases/UpdateProfileDataUseCase.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ProfilePageBody.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/Cubit/ProfilePageViewModel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, this.userInfoModel});
  static const String id = "ProfilePageView";
  // final User? user;
  final UserInfoModel? userInfoModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfilePageViewModel(getIt.get<UpdateProfileDataUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h),
          child: CustomAppBar(
            title: 'Profile',
            leadingVisibility: false,
          ),
        ),
        body: ProfilePageBody(
          userInfoModel: userInfoModel,
        ),
      ),
    );
  }
}
