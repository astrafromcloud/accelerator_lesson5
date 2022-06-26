import 'package:accelerator_lesson5/constants/app_assets.dart';
import 'package:accelerator_lesson5/screen/characters/widget/appBar.dart';
import 'package:accelerator_lesson5/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/app_colors.dart';
import '../../generated/l10n.dart';

typedef GetColor = void Function(Color? color, String? string);

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {

  int _initIndex = 0;

  final List pages = [
    const CharactersAppBar(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: pages[_initIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _initIndex,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: AppColors.bottomBarSelected),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedItemColor: AppColors.bottomBarSelected,
          unselectedItemColor: AppColors.bottomBarUnselected,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.alien),
                activeIcon: SvgPicture.asset(AppAssets.svg.alien, color: AppColors.bottomBarSelected,),
                label: S.of(context).characters),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(AppAssets.svg.settings),
                activeIcon: SvgPicture.asset(AppAssets.svg.settings, color: AppColors.bottomBarSelected,),
                label: S.of(context).settings),
          ],
          onTap: (value) => setState(() {
            _initIndex = value;
          }),
        ),
      ),
    );
  }
}
