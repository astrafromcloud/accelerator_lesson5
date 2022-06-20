import 'package:accelerator_lesson5/screen/characters/widget/appBar.dart';
import 'package:flutter/material.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: const CharactersAppBar(),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   showUnselectedLabels: true,
      //   selectedFontSize: 12,
      //   unselectedFontSize: 12,
      //   selectedItemColor: AppColors.bottomBarSelected,
      //   unselectedItemColor: AppColors.bottomBarUnselected,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.telegram,
      //         ),
      //         label: 'Персонажи'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.charging_station,
      //         ),
      //         label: 'Локации'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.live_tv_rounded,
      //         ),
      //         label: 'Эпизоды'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.settings,
      //         ),
      //         label: 'Настройки'),
      //   ],
      // ),
    );
  }
}
