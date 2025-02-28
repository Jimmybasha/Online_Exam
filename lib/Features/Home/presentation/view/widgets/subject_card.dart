import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required this.image,
    required this.name,
  });
  final String image, name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.r),
      child: Card(
        elevation: 4.r,
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 24.w),
            child: Row(
              spacing: 8.w,
              children: [
                Image.asset(image),
                Text(
                  name,
                  style: AppTextStyles.instance.textStyle16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
