import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Validator.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/Reusable_Widgets/CustomTextField.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:online_exam/Core/widgets/show_snack_bar.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ResetPasswordCubit/ResetPasswordState.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ResetPasswordCubit/ResetPasswordViewModel.dart';
import 'package:online_exam/Features/Auth/presentation/view/LoginScreen.dart';

class ResetPasswordScreenBody extends StatefulWidget {
  final String? email;
  const ResetPasswordScreenBody({super.key, required this.email});

  @override
  State<ResetPasswordScreenBody> createState() =>
      _ResetPasswordScreenBodyState();
}

class _ResetPasswordScreenBodyState extends State<ResetPasswordScreenBody> {
  late TextEditingController newPasswordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetPasswordFailureState) {
              showErrorSnackBar(context, state.err);
            }
            if (state is ResetPasswordSuccessState) {
              showSnackBar(context, state.data['message']);
              Navigator.pushNamed(context, LoginScreen.id);
            }
          },
          builder: (context, state) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: AppTextStyles.instance.textStyle20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 26, vertical: 38).r,
                child: Text(
                  "Password must not be empty and must contain 6 characters with upper case letter and one number at least ",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.instance.textStyle16,
                ),
              ),
              CustomTextField(
                hint: "Enter your password",
                label: "New password",
                controller: newPasswordController,
                validator: (value) =>
                    Validator.isEmptyValidation(value, "Password"),
                isPassword: true,
              ),
              CustomTextField(
                hint: "Confirm your password",
                label: "Confirm  password",
                controller: confirmPasswordController,
                validator: (value) => Validator.confirmPasswordValidation(
                    value,
                    newPasswordController.text.trim(),
                    confirmPasswordController.text.trim()),
                isPassword: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16).r,
                child: CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ResetPasswordViewModel>().resetPassword(
                            newPasswordController.text.trim(),
                            widget.email ?? "Email not found");
                      }
                      print(
                          "Email in the ResetPasswordScreenBody ${widget.email}");
                    },
                    child: state is ResetPasswordLoadingState
                        ? Center(child: CircularProgressIndicator())
                        : Text("Continue",
                            style: AppTextStyles.instance.textStyle18
                                .copyWith(color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
