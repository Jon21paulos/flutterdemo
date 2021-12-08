import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleproject/store/theme_provider.dart';
import 'language_picker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final Color backgroundColor;

  const CustomAppBar({Key? key, required this.title, required this.backgroundColor}) : super(key: key);
 @override
 Size get preferredSize =>const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      actions:  [
            Switch(
                value: context.watch<ThemeNotifier>().darkTheme,
                onChanged: (val){
                  context.read<ThemeNotifier>().toggleTheme();
                }
            ),
        const LanguagePickerWidget(),

      ],
    );
  }
}
