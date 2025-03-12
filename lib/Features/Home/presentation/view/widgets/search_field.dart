import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 30,
          color: Color(0xff878787),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          fontSize: AppTextStyles.instance.textStyle14.fontSize,
          color: Color(0xff878787),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
    );
  }
}
