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
    final phoneRegex = RegExp(r'^\d+$');
    if (!phoneRegex.hasMatch(value!)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }




  }

