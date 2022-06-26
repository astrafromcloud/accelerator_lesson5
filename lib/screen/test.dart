import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            height: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey.withOpacity(0.5)),
            child: Row(
              children: [
                const Expanded(
                  child: Icon(Icons.search_sharp),
                  flex: 2,
                ),
                Expanded(
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Rome',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      isCollapsed: true,),
                  ),
                  flex: 16,
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: VerticalDivider(
                        thickness: 2,
                        color: Colors.black,
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
                  flex: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
