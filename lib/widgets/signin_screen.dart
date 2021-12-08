import 'package:flutter/material.dart';
import 'package:simpleproject/widgets/appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.pink,
        title: AppLocalizations.of(context)!.signin,
      ),
      body: SingleChildScrollView(
           child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('lib/assets/logo.png')),
                ),
              ),
              Padding(
                padding: const  EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      border: const  OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.email,
                      hintText: AppLocalizations.of(context)!.plaseenteryouremail),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: AppLocalizations.of(context)!.password,
                      hintText: AppLocalizations.of(context)!.pleaseenteryourpassword ),
                ),
              ),
              FlatButton(
                onPressed: (){

                },
                child:  Text(
                  AppLocalizations.of(context)!.forgotpassword ,
                  style: const TextStyle(color: Colors.pink, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.pink, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/about'
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login ,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 130,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child:  Text(
                    AppLocalizations.of(context)!.createnewaccount ,
                    style:const TextStyle(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)
                )
              )
            ],
        ),
      ),
    );
  }
}
