import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_info_widget.dart';

class AllExamsBySubjectScreenBody extends StatelessWidget {
  const AllExamsBySubjectScreenBody({super.key, required this.exam});
  final List<Exam> exam;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Expanded(
            child: ListView.builder(
                itemCount: exam.length,
                itemBuilder: (context, index) {
                  return ExamInfoWidget(exam: exam[index]);
                }),
          )
        ],
      ),
    );
  }
}
