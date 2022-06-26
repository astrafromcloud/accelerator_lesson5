import 'package:accelerator_lesson5/constants/app_colors.dart';
import 'package:accelerator_lesson5/constants/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import 'grid_view.dart';
import 'list_view.dart';

class CharactersAppBar extends StatefulWidget {
  const CharactersAppBar({Key? key}) : super(key: key);

  @override
  State<CharactersAppBar> createState() => CharactersAppBarState();
}

class CharactersAppBarState extends State<CharactersAppBar> {
  static bool formatList = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.white),
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(Icons.search_sharp),
                    flex: 4,
                  ),
                  Expanded(
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: S.of(context).findPerson,
                        labelStyle: const TextStyle(color: AppColors.bottomBarUnselected),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        isCollapsed: true,),
                    ),
                    flex: 24,
                  ),
                  const Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: VerticalDivider(
                          thickness: 2,
                          color: AppColors.bottomBarUnselected,
                        )),
                    flex: 1,
                  ),
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: const Icon(Icons.filter_list_alt),
                      ),
                    ),
                    flex: 3,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(S.of(context).personsTotal(20).toUpperCase(),
                    style: AppStyles.s10w500Grey),
              ),
              IconButton(
                splashRadius: 24,
                  onPressed: () {
                  setState(() {
                    formatList = !formatList;
                  });
                  }, icon: formatList == false ? const Icon(Icons.grid_view_rounded) : const Icon(Icons.format_list_bulleted)),
            ],
          ),
          Expanded(child: formatList == false ? const CharactersListView() : const CharactersGridView())
        ],
      ),
    );
  }
}
