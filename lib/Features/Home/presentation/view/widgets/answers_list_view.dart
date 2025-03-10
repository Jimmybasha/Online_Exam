import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class AnswersListView extends StatefulWidget {
  const AnswersListView({super.key});

  @override
  State<AnswersListView> createState() => _AnswersListViewState();
}

class _AnswersListViewState extends State<AnswersListView> {
  int? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: 3,
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
              title: Text('Its going to rain today.',
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
