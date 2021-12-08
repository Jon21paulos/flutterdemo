import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/store/localization_provider.dart';
import 'package:simpleproject/utils/constants/i18n.dart';

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? const Locale('en');

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        items: I18n.all.map(
              (locale) {
            final lang = I18n.getLanguage(locale.languageCode);

            return DropdownMenuItem(
              child:
                 Text(
                  lang,
                  style: const TextStyle(fontSize: 18 ),
                ),

              value: locale,
              onTap: () {
                final provider =
                Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
