import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_error_widget.dart';
import 'package:online_exam/Features/Home/presentation/view/Cubit/get_all_questions_on_exam_view_model_cubit.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/answers_list_view.dart';

import '../../../data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import '../../../data/models/all_questions_on_exam/answer_model.dart';
import '../score_screen.dart';
import 'QuestionsScreenBodyActionButton.dart';

class QuestionsScreenBody extends StatefulWidget {
  final Exam examModel;

  const QuestionsScreenBody({super.key, required this.examModel});

  @override
  State<QuestionsScreenBody> createState() => _QuestionsScreenBodyState();
}

class _QuestionsScreenBodyState extends State<QuestionsScreenBody> {
  int pageNumber = 1;
  List<int> questionIndexList = [];

  // Map to store selected answers for each question
  Map<int, int> selectedAnswers = {};
  List<Map<String, String>> answerList = [];
  void addAnswerToList(String answerKey, String questionId, int questionIndex) {
    answerList.add({"questionId": questionId, "correct": answerKey});
    questionIndexList.add(questionIndex);
  }

  //value
  void _handleAnswerSelected(int questionIndex, int answerIndex) {
    setState(() {
      selectedAnswers[questionIndex] = answerIndex;
    });
    //
    // print("A${(selectedAnswers[questionIndex])! + 1}");
  }

  void _showNoAnswerSelectedWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please select an answer before proceeding'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int questionNumber = pageNumber - 1;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 11.h),
        Text(
            'Question ${questionNumber + 1} of ${widget.examModel.numberOfQuestions}',
            style: AppTextStyles.instance.textStyle14
                .copyWith(color: AppColors.kNoOfQuestionsColor)),
        SizedBox(height: 3.h),
        LinearProgressBar(
          minHeight: 4,
          maxSteps: widget.examModel.numberOfQuestions,
          progressType: LinearProgressBar.progressTypeLinear,
          currentStep: pageNumber,
          progressColor: AppColors.kPrimaryColor,
          backgroundColor: Color(0xffCFCFCF),
        ),
        SizedBox(height: 28.h),
        BlocConsumer<GetAllQuestionsOnExamViewModelCubit,
            GetAllQuestionsOnExamViewModelState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is GetAllQuestionsOnExamFailureState) {
              return CustomErrorWidget(
                title: state.error,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              );
            }
            if (state is GetAllQuestionsOnExamSuccessState) {
              return Column(children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    state.questionExamModel.questions[questionNumber]
                            .question ??
                        "No Question Found",
                    style: AppTextStyles.instance.textStyle18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 24.h),
                AnswersListView(
                  answers:
                      state.questionExamModel.questions[questionNumber].answers,
                  selectedAnswerIndex: selectedAnswers[questionNumber],
                  onAnswerSelected: (index) {
                    _handleAnswerSelected(questionNumber, index);
                  },
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: pageNumber == 1
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceAround,
                  children: [
                    pageNumber == 1
                        ? SizedBox.shrink()
                        : QuestionsScreenBodyActionButton(
                            backgroundColor: Colors.white,
                            text: 'Back',
                            onPressed: () {
                              setState(() {
                                pageNumber = pageNumber - 1;
                              });
                            },
                            textColor: AppColors.kPrimaryColor),
                    QuestionsScreenBodyActionButton(
                        backgroundColor: AppColors.kPrimaryColor,
                        text: pageNumber ==
                                state.questionExamModel.questions.length
                            ? "Check Score"
                            : "Next",
                        onPressed: () {
                          if (selectedAnswers.containsKey(questionNumber)) {
                            addAnswerToList(
                                "A${(selectedAnswers[questionNumber])! + 1}",
                                state.questionExamModel
                                    .questions[questionNumber].id
                                    .toString(),
                                questionNumber);

                            if (pageNumber ==
                                state.questionExamModel.questions.length) {
                              Navigator.pushNamed(context, ScoreScreen.id,
                                  arguments: {"answerList": answerList , "questionIndexList": questionIndexList});
                            } else {
                              setState(() {
                                pageNumber = pageNumber + 1;
                              });
                            }
                          } else {
                            _showNoAnswerSelectedWarning();
                          }
                        },
                        textColor: Colors.white),
                  ],
                ),
              ]);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
