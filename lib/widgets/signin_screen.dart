import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simpleproject/widgets/email_signin_screen.dart';
import 'components/button_item.dart';
import 'signin_otp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  bool signUpwithphone = false;
  void changeState(){
    setState(() {
      signUpwithphone = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom !=0;

    return  Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 10),

                  if(!isKeyboard)
                    Container(
                      height: 150,
                      alignment: Alignment.center, // This is needed
                      child: Image.asset(
                         "lib/assets/computer.png",
                        fit: BoxFit.contain,
                        width: 300,
                      ),
                  ),

                  const SizedBox(height: 10),

                  signUpwithphone?  SignInOtpScreen():
                      Column(
                        children: [

                          if(!isKeyboard) buttonItem(context,changeState),

                          const SizedBox(height: 10),

                          if(!isKeyboard) Center(
                            child: Text(
                              "or",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline6,
                            ),
                          ),

                          const EmailSignIn(),

                        ],
                      )
                ]
              ),
            ),
          ),
      );
  }
}
