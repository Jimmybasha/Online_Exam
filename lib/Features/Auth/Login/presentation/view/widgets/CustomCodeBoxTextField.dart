import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCodeBoxTextFiled extends StatelessWidget {
  const CustomCodeBoxTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        height: 68.h,
        width: 74.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Color(0xffDFE7F7)),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
         
          ),
        ),
      ),
    );
  }
}