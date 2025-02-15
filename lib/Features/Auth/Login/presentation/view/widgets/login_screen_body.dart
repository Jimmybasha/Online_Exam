import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/custom_button.dart';
import 'package:online_exam/Core/widgets/custom_text_form_field.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/ForgetPasswordScreen.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/DoNotHaveAccountWidget.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/widgets/remember_me_widget.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24.h),
              CustomTextFormField(
                hintText: 'Enter you email',
                label: 'Email',
                onSaved: (value) {
                  email = value!;
                },
              ),
              SizedBox(height: 24.h),
              CustomTextFormField(
                obscureText: true,
                hintText: 'Enter you password ',
                label: 'Password',
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RememberMeWidget(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPasswordScreen.id);
                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize:
                              AppTextStyles.instance.textStyle12.fontSize),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.pushNamed(context, ForgetPasswordScreen.id);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Login'),
              SizedBox(height: 16.h),
              DoNotHaveAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
