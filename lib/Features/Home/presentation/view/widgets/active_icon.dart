import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';

class ActiveIcon extends StatelessWidget {
  const ActiveIcon({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.h,
      width: 64.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.kActiveIconColor,
      ),
      child: Image.asset(image),
    );
  }
}
