class Validator{



  static String? isEmptyValidation(String? value,String label){
    if (value == null || value.isEmpty) {
      return 'Please enter your ${label}';
    }
    return null;
  }


  static String? emailValidation(String? value){

    String? emptyValidationMessage = isEmptyValidation(value, "Email");
    if (emptyValidationMessage != null) {
      return emptyValidationMessage; // Return the empty validation message
    }

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(value!)) {
      return 'The Email is not Valid';
    }
    return null; // null means it's good to go
  }

  static String? phoneNumberValidation(String? value) {
    String? emptyValidationMessage = isEmptyValidation(value, "Phone Number");
    if (emptyValidationMessage != null) {
      return emptyValidationMessage; // Return the empty validation message
    }
    final phoneRegex = RegExp(r'^01\d{9}$'); // Starts with 01 + 9 more digits (total 11)
    if (!phoneRegex.hasMatch(value!)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? confirmPasswordValidation(String? value,String? password1,String password2){
    String? emptyValidationMessage = isEmptyValidation(value,"Password Confirmation");
    if (emptyValidationMessage != null) {
      return emptyValidationMessage; // Return the empty validation message
    }
    if(password1!=password2){
      return "Password doesn't match";
    }
    return null;
  }


  }

