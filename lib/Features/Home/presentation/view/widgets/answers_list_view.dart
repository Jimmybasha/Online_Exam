import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

import '../../../data/models/all_questions_on_exam/answer_model.dart';

class AnswersListView extends StatefulWidget {


  final List<AnswerModel>? answers;


  const AnswersListView({super.key,required this.answers});

  @override
  State<AnswersListView> createState() => _AnswersListViewState();
}

class _AnswersListViewState extends State<AnswersListView> {

  int? selectedAnswer;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  formKey =  GlobalKey<FormState>();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: widget.answers!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
            child: RadioListTile(
              contentPadding:
                  EdgeInsets.only(left: 12.w, top: 17.5.h, bottom: 17.5.h),
              activeColor: AppColors.kPrimaryColor,
              tileColor: AppColors.kNavBarBackgroundColor,
              selected: selectedAnswer == index,
              selectedTileColor:
                  selectedAnswer == index ? AppColors.kActiveIconColor : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              title: Text(widget.answers![index].answer,
                  style: AppTextStyles.instance.textStyle14),
              value: index,
              groupValue: selectedAnswer,

              onChanged: (value) {

                selectedAnswer = value;

                setState(() {});
              },
            ),
          );
        });
  }
}


