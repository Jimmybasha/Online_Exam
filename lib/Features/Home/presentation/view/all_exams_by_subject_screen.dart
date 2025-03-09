import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Core/di/di.dart';
import 'package:online_exam/Core/widgets/custom_app_bar.dart';
import 'package:online_exam/Core/widgets/custom_error_widget.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model/subject.dart';
import 'package:online_exam/Features/Home/domain/use_cases/get_all_exams_on_subjects_use_case.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/all_exmas_by_subject_screen_body.dart';

import '../view_model/cubit/get_all_exmas_on_subjects_cubit/cubit/get_all_exams_on_subject_cubit.dart';

class AllExamsBySubjectScreen extends StatelessWidget {
  const AllExamsBySubjectScreen({super.key});
  static const String id = 'all_exam_by_subject_screen';
  @override
  Widget build(BuildContext context) {
    var subject = ModalRoute.of(context)!.settings.arguments as Subject;
    return BlocProvider(
      create: (context) =>
          GetAllExamsOnSubjectCubit(getIt.get<GetAllExamsOnSubjectsUseCase>())
            ..getAllExamsOnSubjects(subjId: subject.id!),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kAppBarHight.h),
          child: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: CustomAppBar(
                title: subject.name ?? 'No name', leadingVisibility: true),
          ),
        ),
        body: BlocBuilder<GetAllExamsOnSubjectCubit, GetAllExamsOnSubjectState>(
          builder: (context, state) {
            if (state is GetAllExamsOnSubjectSuccess) {
              if (state.allExamsOnSubjectsModel.exams!.isEmpty) {
                return CustomErrorWidget(
                    title: 'Ooops',
                    content: 'There Is No Exams',
                    onPressed: () {
                      Navigator.pop(context);
                    });
              } else {
                return AllExamsBySubjectScreenBody(
                    exam: state.allExamsOnSubjectsModel.exams ?? []);
              }
            } else if (state is GetAllExamsOnSubjectFailure) {
              return CustomErrorWidget(
                  title: 'Ooops',
                  content: state.errorMessage,
                  onPressed: () {
                    Navigator.pop(context);
                  });
            } else {
              
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
