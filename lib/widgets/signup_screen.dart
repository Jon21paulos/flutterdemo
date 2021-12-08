import 'package:flutter/material.dart';
import 'package:simpleproject/widgets/appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppLocalizations.of(context)!.signup ,
        backgroundColor: Colors.pink,

      ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:  TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.name,
                    hintText: AppLocalizations.of(context)!.pleaseenteryourname
                )
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.email,
                    hintText: AppLocalizations.of(context)!.plaseenteryouremail
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppLocalizations.of(context)!.password ,
                    hintText: AppLocalizations.of(context)!.pleaseenteryourpassword
                ),
              ),
            ),
            const SizedBox(
              height: 50,
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
                child:  Text(
                  AppLocalizations.of(context)!.login ,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
