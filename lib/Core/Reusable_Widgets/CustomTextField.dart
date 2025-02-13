import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/AppStyles.dart';

class CustomTextField extends StatelessWidget {

  String hint;
  String label;
  bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;


  CustomTextField({
    required this.hint,
    required this.label,
    this.isPassword=false,
    this.validator,
    required this.controller

  });



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(13).r,
      child: TextFormField(
      controller: controller,
      obscureText: isPassword?true:false,
      decoration: InputDecoration(
      labelText: label,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      labelStyle: AppStyles.labelStyle,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0.r),borderSide: BorderSide(
        width: 5.w
      )),
      contentPadding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
      validator: validator,
      ),
    );
  }
}
