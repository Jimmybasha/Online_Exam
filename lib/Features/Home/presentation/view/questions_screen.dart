import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/questions_screen_body.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});
  static const String id = 'QuestionsScreen';

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  double examTime = 30.00;
  @override
  void initState() {
    Timer.periodic(Duration(minutes: 1), (timer) {
      if (examTime > 0) {
        setState(() {
          examTime--;
        });
      } else {
        timer.cancel();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHight.h),
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, right: 16.w),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new)),
                    Text(
                      'Exam',
                      style: AppTextStyles.instance.textStyle20
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  spacing: 8.w,
                  children: [
                    Image.asset('assets/images/alarm_clock.png'),
                    Text(
                      "${examTime.toStringAsFixed(2)} ",
                      style: AppTextStyles.instance.textStyle20.copyWith(
                          color: examTime > 15.00
                              ? AppColors.kNonCriticalTime
                              : Colors.red),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: QuestionsScreenBody(),
    );
  }
}
