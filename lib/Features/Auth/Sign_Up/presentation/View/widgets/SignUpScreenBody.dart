import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/Constants.dart';
import 'package:online_exam/Features/Auth/Login/presentation/view/LoginScreen.dart';
import 'package:online_exam/Features/Auth/Sign_Up/presentation/View/widgets/AlreadyHaveAccountWidget.dart';
import 'package:online_exam/Features/Auth/Sign_Up/presentation/View_Model/states/SignUpStates.dart';
import '../../../../../../Core/Constants/AppStyles.dart';
import '../../../../../../Core/Constants/Validator.dart';
import '../../../../../../Core/Reusable_Widgets/CustomTextField.dart';
import '../../../../../../Core/di/di.dart';
import '../../View_Model/cubits/SignUpViewModel.dart';

class SignUpScreenBody extends StatefulWidget{


  const SignUpScreenBody({
    super.key,

  });




  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {

  SignUpViewModel signUpViewModel = getIt.get<SignUpViewModel>();

  late  TextEditingController _usernameController ;
  late  TextEditingController _firstNameController ;
  late  TextEditingController _lastNameController ;
  late  TextEditingController _emailController ;
  late  TextEditingController _passwordController ;
  late  TextEditingController _confirmPasswordController ;
  late  TextEditingController _phoneNumberController ;
  final _formKey = GlobalKey<FormState>();


  @override
  initState(){
    super.initState();
    _usernameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();

  }
  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      SizedBox(
        height: MediaQuery.sizeOf(context).height - MediaQuery.viewInsetsOf(context).bottom,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  label: "User name",
                  hint: "Enter your user name",validator: (value) {
                  return Validator.isEmptyValidation(value,"User name");
                },
                  controller: _usernameController,
                ),
                Row(
                  children: [
                    Expanded(child: CustomTextField(
                      label: "First name",
                      hint: "Enter First name",
                      validator: (value) {
                        return Validator.isEmptyValidation(value,"First name");
                      },
                      controller: _firstNameController,
                    )),
                    Expanded(child: CustomTextField(
                      label: "Last name",
                      hint: "Enter Last name",
                      validator: (value) {
                        return Validator.isEmptyValidation(value,"Last name");
                      },
                      controller: _lastNameController,
                    )),
                  ],
                ),
                CustomTextField(
                  label: "Email"
                  ,hint: "Enter your Email",
                  validator: (value) {
                    return Validator.emailValidation(value);
                  },
                  controller: _emailController
                  ,),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "Password",
                        isPassword: true,
                        hint: "Enter Password",
                        validator: (value) {
                          return Validator.isEmptyValidation(value,"Password");
                        },
                        controller: _passwordController,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField
                        (label: "Confirm Password",
                        isPassword: true,hint: "Confirm Password",
                        validator: (value) {
                          return Validator.confirmPasswordValidation(value, _passwordController.text.trim(),_confirmPasswordController.text.trim());
                        },
                        controller: _confirmPasswordController,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  label: "Phone Number",
                  hint: "Enter Phone number",
                  validator: (value) {
                    return Validator.phoneNumberValidation(value);
                  },
                  controller: _phoneNumberController,
                ),
                BlocBuilder<SignUpViewModel, SignUpState>(
                  bloc: signUpViewModel,
                  builder: (context, state) {
                    if (state is SignUpFailureState) {
                      return Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          state.err,
                          // Display error message
                          style: TextStyle(color: Colors.red, fontSize: 16.sp),
                        ),
                      );
                    }
                    if (state is SignUpSuccessState) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(SIGNUP_SUCCESS_MESSAGE),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 3),
                          ),
                        );
                        Navigator.pushNamed(context, LoginScreen.id);
                      });
                    }
                      return SizedBox.shrink();
                  }
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: BlocBuilder<SignUpViewModel, SignUpState>(
                    bloc: signUpViewModel,
                    builder: (context, state) {
                      bool isLoading = state is SignUpLoadingState;
                      return ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                          if (_formKey.currentState?.validate() ?? false) {
                             await signUpViewModel.signUpUser( _usernameController.text.trim(),
                              _firstNameController.text.trim(),
                              _lastNameController.text.trim(),
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              _phoneNumberController.text.trim(),
                              _confirmPasswordController.text.trim()
                            );
                          }
                        },
                        style: AppStyles.buttonStyle,
                        child: isLoading
                            ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                            : const Text(SIGNUP_MESSAGE, style: TextStyle(color: Colors.white)),
                      );
                    },
                  ),
                ),
               AlreadyHaveAccountWidget(onLoginPressed:() {
                 signUpViewModel.navigateToLogin();
               } ,),
              ],
            ),
          ),
        ),
      );
  }
}