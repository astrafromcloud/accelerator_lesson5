import 'package:accelerator_lesson5/screen/characters/characters_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'generated/l10n.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SafeArea(child: CharactersScreen()),
      localizationsDelegates: const [
        S.delegate,
      ],
      locale: const Locale('ru_RU'),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
