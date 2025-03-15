
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_questions_on_exam_use_case.dart';
import 'package:online_exam/Features/Home/presentation/view/Cubit/get_all_questions_on_exam_view_model_cubit.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/questions_screen_app_bar.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/questions_screen_body.dart';

import '../../data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  static const String id = 'QuestionsScreen';

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  Exam? examModel;
  int? examDuration;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args is Exam) {
      setState(() {
        examModel = args;
        examDuration = examModel!.duration;
      });
    } else {
      debugPrint("Error: Exam model not found in arguments");
    }
  }

  @override
  void initState() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      if (examDuration! > 0) {
        setState(() {
          examDuration = examDuration! -1;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return BlocProvider(
      create: (context) =>GetAllQuestionsOnExamViewModelCubit(
          getIt.get<GetAllQuestionsOnExamUseCase>(),

      )..getAllQuestions(examId:examModel?.id??"No id found") ,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHight.h),
          child: QuestionsScreenAppBar(examModel: examModel, examDuration: examDuration),
        ),
        body: QuestionsScreenBody(examModel: examModel!,),
      ),
    );
  }
}

