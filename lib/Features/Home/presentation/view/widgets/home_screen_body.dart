import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:online_exam/Core/widgets/custom_error_widget.dart';
import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';

import 'package:online_exam/Features/Home/presentation/view/widgets/all_subjects_survey.dart';

import 'package:online_exam/Features/Home/presentation/view_model/cubit/get_all_subjects_cubit/get_all_subjects_cubit.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocBuilder<GetAllSubjectsCubit, GetAllSubjectsState>(
        builder: (context, state) {
          if (state is GetAllSubjectsFailure) {
            return CustomErrorWidget(
              onPressed: () {
                if (state.errorMessage == "token not provided" ||
                    state.errorMessage == "invalid token") {
                  Navigator.pushNamed(context, LoginScreen.id);
                } else {
                  Navigator.pop(context);
                }
              },
              title: state.errorMessage,
              content: state.errorMessage == "token not provided" ||
                      state.errorMessage == "invalid token"
                  ? 'try to login again'
                  : '',
            );
          } else if (state is GetAllSubjectsSuccess) {
            return AllSubjectsSurvey(
                subjects: state.subjectsModel.subjects ?? []);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
