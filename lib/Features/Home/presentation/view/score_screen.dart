import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Home/domain/use_cases/check_answers_use_case.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/score_screen_bloc_builder_.dart';
import 'package:online_exam/Features/Home/presentation/view_model/cubit/check_answers/check_answers_cubit.dart';

class ScoreScreen extends StatelessWidget {
  static const String id = "ScoreScreenId";
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Map<String, dynamic>> data = ModalRoute.of(context)!.settings.arguments as List<Map<String, dynamic>>;

    return BlocProvider(
      create: (context) => CheckAnswersCubit(getIt.get<CheckAnswersUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kAppBarHight.h),
            child: CustomAppBar(
              title: 'Exam score',
              leadingVisibility: true,
            )),
        body: ScoreScreenBlocBuilder(),
      ),
    );
  }
}
