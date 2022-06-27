import 'package:accelerator_lesson5/screen/characters/characters_screen.dart';
import 'package:accelerator_lesson5/screen/login/login_screen.dart';
import 'package:accelerator_lesson5/screen/settings/settings_screen.dart';
import 'package:accelerator_lesson5/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'generated/l10n.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  Map<String, WidgetBuilder> get routes {
    return {
      '/': (context) {
        return const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.black),
          child: SplashScreen(),
        );
      },
      '/login': (context) {
        return const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.white),
          child: LoginScreen(),
        );
      },
      '/login/characters': (context) {
        return const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.white),
          child: CharactersScreen(),
        );
      },
      '/login/settings': (context) {
        return const AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(statusBarColor: Colors.white),
          child: SettingsScreen(),
        );
      },
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/login/characters': (context) => const CharactersScreen(),
      //   '/login/settings': (context) => const SettingsScreen()
      // },
      localizationsDelegates: const [
        S.delegate,
      ],
      locale: const Locale('ru_RU'),
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

