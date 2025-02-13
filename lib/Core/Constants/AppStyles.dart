import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppStyles{


  static TextStyle? pageTitle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
  static TextStyle? labelStyle = TextStyle(
    fontWeight: FontWeight.w400,
    color: Color(0xff535353),
    fontSize: 12.sp,
  );
  static ButtonStyle? buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xff02369C),
    fixedSize:Size(343.w, 44.h)
  );


}