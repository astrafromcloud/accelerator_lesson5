import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../generated/l10n.dart';

class LanguageDropDown extends StatefulWidget {
  const LanguageDropDown({Key? key}) : super(key: key);

  @override
  State<LanguageDropDown> createState() => _LanguageDropDownState();
}

class _LanguageDropDownState extends State<LanguageDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: Intl.getCurrentLocale(),
        items: [
          DropdownMenuItem(value: 'en', child: Text(S.of(context).english)),
          DropdownMenuItem(value: 'ru_RU', child: Text(S.of(context).russian))
        ],
        onChanged: (value) async {
          if (value == 'ru_RU') {
            await S.load(const Locale('ru', 'RU'));
            setState(() {});
          } else if (value == 'en') {
            await S.load(const Locale('en'));
            setState(() {});
          }
        });
  }
}
