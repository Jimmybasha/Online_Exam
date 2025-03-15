import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/Core/Constants/AppStyles.dart';
import 'package:online_exam/Core/Constants/Validator.dart';
import 'package:online_exam/Core/Constants/app_colors.dart';
import 'package:online_exam/Core/Constants/app_text_style.dart';
import 'package:online_exam/Core/Reusable_Widgets/CustomTextField.dart';
import 'package:online_exam/Core/widgets/show_snack_bar.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View/widgets/ResetPasswordPage.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/Cubit/ProfilePageViewModel.dart';
import 'package:online_exam/Features/Profile/Profile/presentation/View_Model/States/ProfilePageStates.dart';

import 'package:online_exam/Features/Auth/data/Models/user_model/user.dart';

class ProfilePageBody extends StatefulWidget {
  final User? user;
  const ProfilePageBody({super.key, required this.user});

  @override
  State<ProfilePageBody> createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  late TextEditingController _usernameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  final _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    _usernameController = TextEditingController(
        text: widget.user?.username ?? "userName isn't available");
    _firstNameController = TextEditingController(
        text: widget.user?.firstName ?? "firstName isn't available");
    _lastNameController = TextEditingController(
        text: widget.user?.lastName ?? "lastName isn't available ");
    _emailController = TextEditingController(
        text: widget.user?.email ?? "Email isn't available");
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController(
        text: widget.user?.phone ?? "Phone isn't available");
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
          child: BlocConsumer<ProfilePageViewModel, ProfilePageState>(
            listener: (context, state) {
              if (state is ProfilePageFailureState) {
                return showErrorSnackBar(context, state.error);
              }
              if (state is ProfilePageSuccessState) {
                return showSnackBar(context, state.user['message']);
              }
            },
            builder: (context, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50.r,
                      backgroundImage: AssetImage("assets/images/image1.jpg"),
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
                          onPressed: () {},
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
                CustomTextField(
                    hint: "James",
                    label: "User Name",
                    controller: _usernameController),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                            hint: _firstNameController.text.trim(),
                            label: "First Name",
                            controller: _firstNameController)),
                    Expanded(
                        child: CustomTextField(
                            hint: _lastNameController.text.trim(),
                            label: "Last Name",
                            controller: _lastNameController)),
                  ],
                ),
                CustomTextField(
                  hint: _emailController.text.trim(),
                  label: "Email",
                  controller: _emailController,
                  validator: (value) => Validator.emailValidation(value),
                ),
                CustomTextField(
                    hint: "*****",
                    label: "Password",
                    controller: _passwordController,
                    isPassword: true,
                    suffixIcon: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ResetPasswordPage.id);
                        },
                        child: Text(
                          "Change",
                          style: TextStyle(color: AppColors.iconColor),
                        ))),
                CustomTextField(
                    hint: _phoneNumberController.text.trim(),
                    label: "Phone Number",
                    controller: _phoneNumberController),
                ElevatedButton(
                  onPressed: () {
                    // Unfocus the text field
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      Map<String, dynamic> updatedData = {
                        "username": _usernameController.text.trim(),
                        "firstName": _firstNameController.text.trim(),
                        "lastName": _lastNameController.text.trim(),
                        "email": _emailController.text.trim(),
                        "phone": _phoneNumberController.text.trim(),
                      };

                      context
                          .read<ProfilePageViewModel>()
                          .updateProfile(updatedData);
                    }
                  },
                  style: AppStyles.buttonStyle,
                  child: state is ProfilePageLoadingState
                      ? CircularProgressIndicator()
                      : Text("Update",
                          style: AppTextStyles.instance.textStyle16
                              .copyWith(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
