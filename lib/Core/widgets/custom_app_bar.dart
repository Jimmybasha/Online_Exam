import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingVisibility,
  });
  final String title;
  final bool leadingVisibility;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: leadingVisibility,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new))),
          Text(
            title,
            style: AppTextStyles.instance.textStyle20
                .copyWith(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
