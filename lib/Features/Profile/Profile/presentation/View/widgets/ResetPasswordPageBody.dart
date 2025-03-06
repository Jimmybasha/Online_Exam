import 'package:flutter/material.dart';
import 'package:online_exam/Core/Constants/Validator.dart';

import '../../../../../../Core/Constants/AppStyles.dart';
import '../../../../../../Core/Constants/app_text_style.dart';
import '../../../../../../Core/Reusable_Widgets/CustomTextField.dart';

class ResetPasswordPageBody extends StatefulWidget {
  const ResetPasswordPageBody({super.key});

  @override
  State<ResetPasswordPageBody> createState() => _ResetPasswordPageBodyState();
}

class _ResetPasswordPageBodyState extends State<ResetPasswordPageBody> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _newPasswordConfirmationController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();

    _currentPasswordController = TextEditingController();
    _newPasswordController = TextEditingController();
    _newPasswordConfirmationController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _newPasswordConfirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
        CustomTextField(
          label: "Current Password",
          hint: "Current Password",
          isPassword: true,
          controller: _currentPasswordController,
        ),
        CustomTextField(
          label: "New Password",
          hint: "New Password",
          isPassword: true,
          controller: _newPasswordController,
        ),
        CustomTextField(
          label: "Confirm Password",
          hint: "Confirm Password",
          isPassword: true,
          controller: _newPasswordController,
          validator: (value) => Validator.confirmPasswordValidation(
              value,
              _newPasswordController.text.trim(),
              _newPasswordConfirmationController.text.trim()),
        ),
        ElevatedButton(
          onPressed: () {},
          style: AppStyles.buttonStyle,
          child: Text("Update",
              style: AppTextStyles.instance.textStyle16
                  .copyWith(color: Colors.white)),
        ),
      ]),
    );
  }
}
