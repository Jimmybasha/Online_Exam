import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({
    super.key,
  });

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: BorderSide(color: AppColors.kTextFieldBorderColor),
            value: isChecked,
            onChanged: (newValue) {
              isChecked = newValue;
              setState(() {});
            }),
        Text(
          'Remember me',
          style: AppTextStyles.instance.textStyle13,
        )
      ],
    );
  }
}