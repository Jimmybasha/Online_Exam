import 'package:flutter/material.dart';

import 'package:online_exam/Features/Home/data/models/all_exmas_on_subjects_model/get_all_exams_on_subjects_model/exam.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/exam_details_view_body.dart';

class ExamDetailsView extends StatelessWidget {
  const ExamDetailsView({super.key});
  static const String id = 'ExamDetailsView';
  @override
  Widget build(BuildContext context) {
    var exam = ModalRoute.of(context)!.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: ExamDetailsViewBody(
        exam: exam,
      ),
    );
  }
}
