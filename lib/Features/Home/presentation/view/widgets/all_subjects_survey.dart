import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Features/Home/data/models/subjects_model/subjects_model/subject.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/search_field.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/subject_card.dart';

class AllSubjectsSurvey extends StatelessWidget {
  const AllSubjectsSurvey({
    super.key,
    required this.subjects,
  });
  final List<Subject> subjects;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        SearchField(),
        SizedBox(
          height: 40.h,
        ),
        Text(
          'Browse by subject',
          style: AppTextStyles.instance.textStyle18
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 24.h,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (BuildContext context, int index) {
              return SubjectCard(
                  subjectsModel: subjects[index],
                  image: subjects[index].icon!,
                  name: subjects[index].name!);
            },
          ),
        ),
      ],
    );
  }
}
