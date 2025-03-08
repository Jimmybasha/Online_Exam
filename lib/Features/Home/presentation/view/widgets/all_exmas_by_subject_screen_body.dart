import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class AllExamsBySubjectScreenBody extends StatelessWidget {
  const AllExamsBySubjectScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 40.h),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'English',
              style: AppTextStyles.instance.textStyle18
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 24.h),
          InkWell(
            onTap: () {},
            child: Container(
              height: 103.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8.r,
                    spreadRadius: 0.r,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    Image.asset('assets/images/exam.png'),
                    SizedBox(
                      width: 16.w,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'level',
                                style: AppTextStyles.instance.textStyle16
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '30 Minutes',
                                style: AppTextStyles.instance.textStyle13
                                    .copyWith(color: AppColors.kPrimaryColor),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            " 20 Question ",
                            style: AppTextStyles.instance.textStyle13
                                .copyWith(color: Colors.grey),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'From: 1.00   To: 6.00',
                            style: AppTextStyles.instance.textStyle13,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
