import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/score_screen_bloc_builder_.dart';

import '../../../../Core/Constants/Constants.dart';
import '../../../../Core/di/di.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../domain/use_cases/check_answers_use_case.dart';
import '../view_model/cubit/check_answers/check_answers_cubit.dart';

class ScoreScreen extends StatelessWidget {
  static const String id = "ScoreScreenId";
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List<Map<String, String>> answerList = arguments["answerList"];

    print("the answerList from the scoreScreen is $answerList");

    return BlocProvider(
      create: (context) => CheckAnswersCubit(getIt.get<CheckAnswersUseCase>())
        ..checkAnswers(answerList), // Call checkAnswers when the screen loads
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