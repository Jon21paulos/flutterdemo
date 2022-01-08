String? passwordController;

String? nameValidator(value) {
  RegExp regex =  RegExp(r'^.{3,}$');
  if (value!.isEmpty) {
    return ("First Name cannot be Empty");
  }
  if (!regex.hasMatch(value)) {
    return ("Enter Valid name(Min. 3 Character)");
  }
  return null;
}

String? emailValidator(value) {
  if (value!.isEmpty) {
    return ("Please Enter Your Email");
  }
  // reg expression for email validation
  if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
      .hasMatch(value)) {
    return ("Please Enter a valid email");
  }
  return null;
}

String? passwordValidator(value) {
  RegExp regex =  RegExp(r'^.{6,}$');
  if (value!.isEmpty) {
    return ("Password is required for login");}
  if (!regex.hasMatch(value)) {
    return ("Enter Valid Password(Min. 6 Character)");
  }
  passwordController = value;
}

String? confirmPasswordValidator(value) {
  if (value != passwordController) {
    return "Password don't match";
  }
  return null;
}

