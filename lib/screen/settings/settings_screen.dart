import 'package:accelerator_lesson5/constants/app_styles.dart';
import 'package:accelerator_lesson5/screen/settings/widget/dropdown.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        title: Text(S.of(context).settings, style: AppStyles.s20w700,),
      ),
      body: const Center(
        child: LanguageDropDown(),
      ),
    );
  }
}
