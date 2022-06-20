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
          Container(
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.darkBlue),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  icon: const Icon(
                    Icons.search_sharp,
                    color: AppColors.darkBlue,
                  ),
                  label: Text(S.of(context).findPerson),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  suffixIcon: const Icon(Icons.filter_list_alt),
                  suffixIconColor: AppColors.darkBlue,
                ),
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
