
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

import 'package:online_exam/Features/Home/presentation/view/widgets/search_field.dart';
import 'package:online_exam/Features/Home/presentation/view/widgets/subject_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    
    
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
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
            // SubjectCard(
            //     image:, name: ),
            SubjectCard(image: 'assets/images/math_image.png', name: 'Math'),
            SubjectCard(image: 'assets/images/art_image.png', name: 'Art'),
            SubjectCard(
                image: 'assets/images/science_image.png', name: 'Science'),
          ],
        ),
      ),
    );
  }
}
