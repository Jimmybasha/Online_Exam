import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      @required this.hintText,
      this.onChanged,
      this.textColor,
      this.onSaved,
      this.keyboardType,
      this.suffixIcon,
      this.obscureText,
      this.label
      //  this.contentPadding,
      });
  final String? hintText;
  final Function(String)? onChanged;
  final Color? textColor;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  final String? label;
  //final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        onSaved: onSaved,
        style: AppTextStyles.instance.textStyle16
            .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
        onChanged: onChanged,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Text(
            label ?? '',
            style: TextStyle(color: AppColors.kTextFieldBorderColor),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: AppTextStyles.instance.textStyle14
              .copyWith(color: AppColors.kHintTextColor),
          contentPadding: EdgeInsets.only(top: 16.h, bottom: 16.h, left: 16.w),
          border: buildBorder(AppColors.kTextFieldBorderColor),
          enabledBorder: buildBorder(AppColors.kTextFieldBorderColor),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.kTextFieldBorderColor),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ));
  }

  OutlineInputBorder buildBorder(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(4.r),
    );
  }
}
