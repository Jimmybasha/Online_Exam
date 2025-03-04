import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCodeBoxTextFiled extends StatelessWidget {
  const CustomCodeBoxTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w), // Reduced spacing for better fit
      child: SizedBox(
        width: 70.w, // Ensuring a perfect square
        height: 70.w, // Height same as width for uniformity
        child: TextField(
          textAlign: TextAlign.center, // Centers the entered text
          style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold), // Bigger text
          maxLength: 1, // Restrict input to 1 character (common for OTP fields)
          keyboardType: TextInputType.number, // Ensures numeric input
          decoration: InputDecoration(
            counterText: "", // Removes the maxLength counter display
            filled: true,
            fillColor: Color(0xffDFE7F7), // Background color
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r), // Rounded corners
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    );
  }
}
