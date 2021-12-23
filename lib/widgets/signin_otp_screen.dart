import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/store/phone_auth_provider.dart';
import 'components/custom_textfield.dart';

class SignInOtpScreen extends StatelessWidget {
  SignInOtpScreen({Key? key}) : super(key: key);
  final TextEditingController  nameController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    final phoneauth = Provider.of<PhoneAuthService>(context);

    return Column(
           mainAxisAlignment: MainAxisAlignment.center,

           children: [

             phoneauth.codeSent? Column(
               children: [

                 PinCodeTextField(
                   length: 6,
                   obscureText: false,
                   animationType: AnimationType.fade,
                   pinTheme: PinTheme(
                     shape: PinCodeFieldShape.box,
                     borderRadius: BorderRadius.circular(5),
                     fieldHeight: 50,
                     fieldWidth: 40,
                     activeFillColor: Theme.of(context).primaryColor,
                   ),
                   animationDuration:const Duration(milliseconds: 300),
                   backgroundColor: Colors.blue.shade50,
                   enableActiveFill: true,
                   onCompleted: (pin) {
                     phoneauth.verifyPin(pin,context,name: nameController.text);
                   },
                   onChanged: (String value) {
                      print(value);
                   },
                   appContext: context,
                 ),

                 const SizedBox(
                   height: 10,
                 ),

                 GestureDetector(
                     onTap: (){
                       phoneauth.verifyPhone(context);
                     },
                     child: Text(
                       "resend code?",
                       style: Theme.of(context).textTheme.headline6,
                     )
                 ),
               ],
             ):

             Column(
               children: [

                 const SizedBox(height: 30,),

                 customNameTextField(nameController, context),

                 const SizedBox(height: 30,),

                 IntlPhoneField(
                   decoration:  InputDecoration(
                      hintText: "please enter your phone number",
                      hintStyle: Theme.of(context).textTheme.subtitle2,
                      labelStyle: Theme.of(context).textTheme.subtitle1,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Theme.of(context).primaryColor )
                      )
                   ),
                     initialCountryCode: 'ET',
                     onChanged: (phoneNumber) {
                       phoneauth.setphone(phoneNumber.completeNumber);
                     },
                 ),
                 const SizedBox(
                   height: 10,
                 ),

                 Text(context.watch<PhoneAuthService>().errorMessage,
                   style: const TextStyle(color: Colors.red,fontSize: 17),
                 ),

                 const SizedBox(
                   height: 10,
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),

                   child: context.watch<PhoneAuthService>().isLoading?

                   const CircularProgressIndicator(
                     valueColor:AlwaysStoppedAnimation<Color>(Colors.blue),
                   ):

                   MaterialButton(
                       color: Theme.of(context).primaryColor,
                       height: 50,
                       minWidth: double.infinity,

                       onPressed: (){
                         phoneauth.verifyPhone(context);
                       },
                       child: Text(
                             "verify",
                             style: Theme.of(context).textTheme.headline6,
                           )
                   ),
                 ),
               ],
             ),
           ],
    );
  }
}
