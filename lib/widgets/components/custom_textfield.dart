import 'package:flutter/material.dart';

Widget customNameTextField(nameController, BuildContext context) => TextFormField(
  autofocus: false,
  controller: nameController,
  keyboardType: TextInputType.name,
  validator: (value) {
    RegExp regex =  RegExp(r'^.{3,}$');
    if (value!.isEmpty) {
      return ("First Name cannot be Empty");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid name(Min. 3 Character)");
    }
    return null;
  },
  onSaved: (value) {
    nameController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    hintText: "Name",
    hintStyle: Theme.of(context).textTheme.subtitle2,
    prefixIcon:  Icon(Icons.person,color: Theme.of(context).iconTheme.color,),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor )
    ),
    suffixIcon: nameController.text.isEmpty?
        Container(width: 0,):
        IconButton(
          icon: Icon(Icons.close,color: Theme.of(context).iconTheme.color,),
          onPressed: () =>nameController.clear(),
        )
  ),
);



Widget customEmailTextField(emailController, BuildContext context) =>TextFormField(
  autofocus: false,
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  validator: (value) {
    if (value!.isEmpty) {
      return ("Please Enter Your Email");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return ("Please Enter a valid email");
    }
    return null;
  },
  onSaved: (value) {
    emailController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    hintText: "Email",
    hintStyle: Theme.of(context).textTheme.subtitle2,
    prefixIcon:  Icon(Icons.mail,color: Theme.of(context).iconTheme.color,),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor )
    ),

      suffixIcon: emailController.text.isEmpty?
        Container(width: 0,):
        IconButton(
          icon: Icon(Icons.close,color: Theme.of(context).iconTheme.color,),
          onPressed: () =>emailController.clear(),
        )
  )
);


Widget customPasswordTextField(passwordController, BuildContext context, isPasswordNotVisible, void Function() changeVisibility)=> TextFormField(
  autofocus: false,
  controller: passwordController,
  obscureText: isPasswordNotVisible,
  validator: (value) {
    RegExp regex =  RegExp(r'^.{6,}$');
    if (value!.isEmpty) {
      return ("Password is required for login");
    }
    if (!regex.hasMatch(value)) {
      return ("Enter Valid Password(Min. 6 Character)");
    }
  },
  onSaved: (value) {
    passwordController.text = value!;
  },
  textInputAction: TextInputAction.next,
  decoration: InputDecoration(
    prefixIcon:  Icon(Icons.vpn_key,color: Theme.of(context).iconTheme.color),
    hintText: "Password" ,
    hintStyle: Theme.of(context).textTheme.subtitle2,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor )
    ),
      suffixIcon: IconButton(
          icon: isPasswordNotVisible?Icon(Icons.visibility_off,color: Theme.of(context).iconTheme.color,):
          Icon(Icons.visibility,color: Theme.of(context).iconTheme.color,),
          onPressed: () =>changeVisibility()),
        )
);


Widget customConfirmPasswordTextField(passwordController,confirmPasswordEditingController, BuildContext context, isPasswordNotVisible, void Function() changeVisibility)=>TextFormField(
  autofocus: false,
  controller: confirmPasswordEditingController,
  obscureText: true,
  validator: (value) {
    if (confirmPasswordEditingController.text !=
        passwordController.text) {
      return "Password don't match";
    }
    return null;
  },
  onSaved: (value) {
    confirmPasswordEditingController.text = value!;
  },
  textInputAction: TextInputAction.done,
  decoration: InputDecoration(
    prefixIcon:  Icon(Icons.vpn_key,color: Theme.of(context).iconTheme.color),
    hintText: "Confirm Password" ,
    hintStyle: Theme.of(context).textTheme.subtitle2,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor)
    ),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Theme.of(context).indicatorColor )
    ),
    suffixIcon: IconButton(
        icon: isPasswordNotVisible?Icon(Icons.visibility_off,color: Theme.of(context).iconTheme.color,):
        Icon(Icons.visibility,color: Theme.of(context).iconTheme.color,),
        onPressed: () =>changeVisibility()),
      ),
);
