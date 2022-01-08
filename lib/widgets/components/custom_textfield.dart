import 'package:flutter/material.dart';
import 'package:simpleproject/utils/form_validation.dart';

import '../email_signin_screen.dart';

Widget customNameTextField(nameController, BuildContext context, Function() submitData) => TextFormField(
  autofocus: false,
  controller: nameController,
  keyboardType: TextInputType.name,
  textInputAction: TextInputAction.go,
  onFieldSubmitted: (value) {
    submitData();
  },
  validator: nameValidator,
  onSaved: (value) {
    nameController.text = value!;
  },

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



Widget customEmailTextField(emailController, BuildContext context, Function() submitData) =>TextFormField(
  autofocus: false,
  controller: emailController,
  keyboardType: TextInputType.emailAddress,
  validator: emailValidator,
  onSaved: (value) {
    emailController.text = value!;
  },
  textInputAction: TextInputAction.go,
    onFieldSubmitted: (value) {
      submitData();
    },
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


Widget customPasswordTextField(passwordController, BuildContext context, isPasswordNotVisible, void Function() changeVisibility, Function() submitData)=> TextFormField(
  autofocus: false,
  controller: passwordController,
  obscureText: isPasswordNotVisible,
  validator: passwordValidator,
  onSaved: (value) {
    passwordController.text = value!;
  },
  textInputAction: TextInputAction.go,
    onFieldSubmitted: (value) {
      submitData();
    },
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


Widget customConfirmPasswordTextField(passwordController,confirmPasswordEditingController, BuildContext context, isPasswordNotVisible, void Function() changeVisibility, Function() submitData)=>TextFormField(
  autofocus: false,
  controller: confirmPasswordEditingController,
  obscureText: isPasswordNotVisible,
  validator:confirmPasswordValidator,
  onSaved: (value) {
    confirmPasswordEditingController.text = value!;
  },
  textInputAction: TextInputAction.go,
  onFieldSubmitted: (value) {
    submitData();
  },
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
  ),
);
