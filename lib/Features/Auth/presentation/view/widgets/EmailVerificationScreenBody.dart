import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/show_snack_bar.dart';
import 'package:online_exam/Features/Auth/presentation/view/ResetPassword.dart';
import 'package:online_exam/Features/Auth/presentation/view/widgets/resend_code.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/EmailVerificationCubit/EmailVerificationViewModel.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/EmailVerificationCubit/EmailVerificationState.dart';

class EmailVerificationScreenBody extends StatefulWidget {
  final String email;
  const EmailVerificationScreenBody({super.key, required this.email});

  @override
  State<EmailVerificationScreenBody> createState() =>
      _EmailVerificationScreenBodyState();
}

class _EmailVerificationScreenBodyState
    extends State<EmailVerificationScreenBody> {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  String get otpCode => controllers.map((c) => c.text).join();
  //1
  //2
  //3

  // 1 2 3
  //123

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailVerificationViewModel, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccessState) {
          showSnackBar(context, state.status);

          //make the ResetPasswordScreen able to take settings

          Navigator.pushNamed(context, ResetPasswordScreen.id,
              arguments: widget.email);
          print("Email from the EmailVerificationScreenBody ${widget.email}");
        } else if (state is EmailVerificationFailureState) {
          showErrorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Email verification',
                    style: AppTextStyles.instance.textStyle18
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    textAlign: TextAlign.center,
                    'Please enter your code that was sent to your email address',
                    style: AppTextStyles.instance.textStyle14,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => SizedBox(
                    width: 45.w,
                    height: 70.h,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                      maxLength: 1,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Color(0xffDFE7F7),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1.5),
                        ),
                      ),
                      onChanged: (value) {
                        print(
                            "from the EmailVerificationScreenBody ${widget.email}");
                        return EmailVerificationViewModel.onOtpChange(
                            value, index, context, otpCode, focusNodes);
                      },
                    ),
                  ),
                ),
              ),
            ),
            if (state is EmailVerificationLoadingState)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Center(child: CircularProgressIndicator()),
              ),
            SizedBox(height: 24.h),
            ResendCode(
              email: widget.email,
            ),
          ],
        );
      },
    );
  }
}
