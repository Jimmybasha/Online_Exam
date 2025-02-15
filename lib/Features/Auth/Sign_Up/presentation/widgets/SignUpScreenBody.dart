import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Constants/AppStyles.dart';
import '../../../../../Core/Constants/Validator.dart';
import '../../../../../Core/Reusable_Widgets/CustomTextField.dart';

class SignUpScreenBody extends StatefulWidget{

  const SignUpScreenBody({super.key});




  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {


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
                          return Validator.isEmptyValidation(value,"Password Confirmation");
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.h
                  ),
                  child: ElevatedButton(
                    onPressed: (){
                      if (_formKey.currentState?.validate() ?? false) {
                      }
                    },
                    style:AppStyles.buttonStyle ,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                      onPressed: (){

                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            decoration: TextDecoration.underline
                        ),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
  }
}