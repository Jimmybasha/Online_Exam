import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({
    super.key,
    this.value,
    this.onChanged,
  });
  final bool? value;
  final void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            side: BorderSide(color: AppColors.kTextFieldBorderColor),
            value: value,
            onChanged: onChanged),
        Text(
          'Remember me',
          style: AppTextStyles.instance.textStyle13,
        )
      ],
    );
  }
}
