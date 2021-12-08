import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'appbar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.pink,
        title: AppLocalizations.of(context)!.about
      ),
      body: Center(
        child:RaisedButton(
          child:  Text(AppLocalizations.of(context)!.gotocontact),
          color: Colors.orangeAccent,
          onPressed: () {
            Navigator.pushNamed(
                context,
                '/contact'
            );
          },
        ),
      ),
    );
  }
}
