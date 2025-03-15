import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/exam_model.dart';
import 'package:online_exam/Features/Home/presentation/view/home_screen.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/ScoreScreenBody.dart';

import '../../../../../Core/widgets/custom_error_widget.dart';
import '../../view_model/cubit/check_answers/check_answers_cubit.dart';
import '../main_screen.dart';

class ScoreScreenBlocBuilder extends StatelessWidget {
  const ScoreScreenBlocBuilder({super.key, required this.examModel});
  final ExamModel examModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<CheckAnswersCubit, CheckAnswersState>(
        builder: (context, state) {
          if (state is CheckAnswersSuccess) {
            final scoreModel =
                BlocProvider.of<CheckAnswersCubit>(context).scoreModel;
            if (scoreModel != null) {
              return ScoreScreenBody(
                scoreModel: scoreModel,
                examModel: examModel,
              );
            } else {
              return CustomErrorWidget(
                title: "Error",
                content: "Failed to load score data",
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              );
            }
          } else if (state is CheckAnswersFailure) {
            return CustomErrorWidget(
              title: "Error",
              content: state.errorMessage,
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.id);
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
