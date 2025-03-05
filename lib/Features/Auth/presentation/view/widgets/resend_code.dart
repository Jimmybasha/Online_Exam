import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/widgets/show_snack_bar.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordState.dart';
import 'package:online_exam/Features/Auth/presentation/View_Model/cubit/ForgetPassworCubit/ForgetPasswordViewModel.dart';

class ResendCode extends StatelessWidget {

  final String email;
  const ResendCode({super.key , required this.email});
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel,ForgetPasswordState>(
      listener:(context, state) {
        if(state is ForgetPasswordSuccessState){
          showSnackBar(context, state.res['info']);
        }else if(state is ForgetPasswordFailureState){
          showErrorSnackBar(context, state.err);
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Didn\'t receive code?',
              style: AppTextStyles.instance.textStyle16),

          GestureDetector(
            onTap: () {
              print("email from the ResendCode Widget $email");
              context.read<ForgetPasswordViewModel>().forgetPassword(email);
              },
            child: Text(" Resend",
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: AppTextStyles.instance.textStyle16.fontSize,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.kPrimaryColor,
                )),
          )
        ],
      ),
    );
  }
}
