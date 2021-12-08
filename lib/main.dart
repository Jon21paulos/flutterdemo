import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/route/route_generator.dart';
import 'package:simpleproject/store/localization_provider.dart';
import 'package:simpleproject/utils/constants/i18n.dart';
import 'package:simpleproject/utils/constants/theme_data.dart';
import 'store/theme_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'utils/constants/i18n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),

      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Simple Project Demo',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().darkTheme? dark:light,
      locale: context.watch<LocaleProvider>().locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: I18n.all,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute ,
    );
  }
}
