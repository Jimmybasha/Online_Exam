import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/Constants/Validator.dart';
import 'package:online_exam/Core/widgets/show_snack_bar.dart';
import 'package:online_exam/Features/Home/presentation/view/main_screen.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/Cubit/UpdatePasswordPageViewModel.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/States/UpdatePasswordState.dart';

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
      child: BlocConsumer<UpdatePasswordPageViewModel, UpdatePasswordState>(
        listener: (context, state) {
          if (state is UpdatePasswordFailureState) {
            showErrorSnackBar(context, state.error);
          }
          if (state is UpdatePasswordSuccessState) {
            showSnackBar(context, state.data['message']);
            Navigator.of(context).pushNamed(MainScreen.id);
          }
        },
        builder: (context, state) => Form(
          key: _formKey,
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
              controller: _newPasswordConfirmationController,
              validator: (value) => Validator.confirmPasswordValidation(
                  value,
                  _newPasswordController.text.trim(),
                  _newPasswordConfirmationController.text.trim()),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<UpdatePasswordPageViewModel>().updatePassword(
                        _currentPasswordController.text.trim(),
                        _newPasswordController.text.trim(),
                      );
                }
              },
              style: AppStyles.buttonStyle,
              child: state is UpdatePasswordLoadingState
                  ? CircularProgressIndicator()
                  : Text("Update",
                      style: AppTextStyles.instance.textStyle16
                          .copyWith(color: Colors.white)),
            ),
          ]),
        ),
      ),
    );
  }
}
