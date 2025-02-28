import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/AppStyles.dart';
import 'package:online_exam/Core/Constants/Validator.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/Reusable_Widgets/CustomTextField.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ResetPasswordPage.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({super.key});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {

  late  TextEditingController _usernameController ;
  late  TextEditingController _firstNameController ;
  late  TextEditingController _lastNameController ;
  late  TextEditingController _emailController ;
  late  TextEditingController _passwordController ;
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
    _phoneNumberController = TextEditingController();

  }
  @override
  void dispose() {
    _usernameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundImage: AssetImage("lib/assets/image1.jpg"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        color: AppColors.iconColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: IconButton(
                        onPressed: () {

                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                          size: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(hint: "James", label: "User Name", controller: _usernameController),
                Row(
                  children: [
                    Expanded(child: CustomTextField(hint: "Ahmed", label: "First Name", controller: _firstNameController)),
                    Expanded(child: CustomTextField(hint: "Gamal", label: "Last Name", controller: _firstNameController)),
                  ],
                ),
              CustomTextField(hint: "James@gmail.com", label: "Email", controller: _emailController,validator:(value) =>  Validator.emailValidation(value),),
              CustomTextField(hint: "Password", label: "Password", controller: _passwordController,isPassword: true,
                  suffixIcon: TextButton(onPressed: (){
                    Navigator.pushNamed(context, ResetPasswordPage.id);
                  }, child: Text("Change",style: TextStyle(
                color: AppColors.iconColor
              ),
              )
              )
              ),
              CustomTextField(hint: "01234567890", label: "Phone Number", controller: _phoneNumberController),
              ElevatedButton(
                  onPressed: (){},
                style: AppStyles.buttonStyle,
                child: Text(
                  "Update",
                  style:AppTextStyles.instance.textStyle16.copyWith(
                    color: Colors.white
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
