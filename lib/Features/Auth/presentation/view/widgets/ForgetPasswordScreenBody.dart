import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/Reusable_Widgets/CustomTextField.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordState.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordViewModel.dart';
import 'package:online_exam/Features/Auth/presentation/view/EmailVerificationScreen.dart';
import '../../../../../Core/widgets/show_snack_bar.dart';

class ForgetPasswordScreenBody extends StatefulWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  State<ForgetPasswordScreenBody> createState() =>
      _ForgetPasswordScreenBodyState();
}

class _ForgetPasswordScreenBodyState extends State<ForgetPasswordScreenBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget password',
                    style: AppTextStyles.instance.textStyle18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Please enter your email associated to your account',
                    style: AppTextStyles.instance.textStyle14,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(
                hint: "Enter Your Email",
                label: "Email",
                controller: emailController),
            SizedBox(height: 48.h),
            CustomButton(
              onPressed: () async {
                print(
                    "The email is !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! ${emailController.text.trim()}");
                if (_formKey.currentState!.validate()) {
                  await context
                      .read<ForgetPasswordViewModel>()
                      .forgetPassword(emailController.text.trim());
                }
              },
              child: BlocConsumer<ForgetPasswordViewModel, ForgetPasswordState>(
                listener: (context, state) {
                  if (state is ForgetPasswordFailureState) {
                    showErrorSnackBar(context, state.err);
                  }
                  if (state is ForgetPasswordSuccessState) {
                    WidgetsBinding.instance.addPostFrameCallback(
                      (timeStamp) {
                        showSnackBar(context, state.res['message']);
                        Navigator.pushNamed(
                            context, EmailVerificationScreen.id , arguments: {'email': emailController.text.trim()});
                      },
                    );
                    print(
                        "🚀 Navigating to EmailVerificationScreen with email: ${emailController.text.trim()}");
                  }
                },
                builder: (context, state) {
                  if (state is ForgetPasswordLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(
                    'Continue',
                    style: AppTextStyles.instance.textStyle16.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
