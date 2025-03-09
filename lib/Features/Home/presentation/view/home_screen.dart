import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_subjects_use_case.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/home_screen_body.dart';
import 'package:online_exam/Features/Home/presentation/view_model/cubit/get_all_subjects_cubit/get_all_subjects_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  GetAllSubjectsCubit(getIt.get<GetAllSubjectsUseCase>())
                ..getAllSubjects(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Survey',
            style: AppTextStyles.instance.textStyle20.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        body: HomeScreenBody(),
      ),
    );
  }
}
