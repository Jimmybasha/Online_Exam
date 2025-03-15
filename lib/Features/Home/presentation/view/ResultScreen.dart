import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/data/models/all_questions_on_exam/exam_model.dart';
import 'package:online_exam/Features/Home/data/models/check_answers_model/check_answer_model/check_answer_model.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/results_screen_body.dart';

class ResultScreen extends StatelessWidget {
  static const String id = "resultScreenId";
  const ResultScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final CheckAnswerModel scoreModel = arguments["scoreModel"];
    final ExamModel examModel = arguments["examModel"];
    log("in ResultScreennnnnnnnnnn $examModel");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Results",
          style: AppTextStyles.instance.textStyle20
              .copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ResultsScreenBody(examModel: examModel, scoreModel: scoreModel,),
    );
  }
}
