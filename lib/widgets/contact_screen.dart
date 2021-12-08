import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'appbar.dart';

class ContactPage extends StatelessWidget {

  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.pink,
        title: AppLocalizations.of(context)!.contact ,
      ),
      body: Center(
        child:RaisedButton(
          child:  Text(AppLocalizations.of(context)!.gobacktoabout),
          color: Colors.orangeAccent,
          onPressed: () {
            Navigator.pop(
                context,
            );
          },
        ),
      ),
    );
  }
}
