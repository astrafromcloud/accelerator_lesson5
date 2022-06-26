import 'package:accelerator_lesson5/constants/app_assets.dart';
import 'package:accelerator_lesson5/constants/app_colors.dart';
import 'package:accelerator_lesson5/constants/app_styles.dart';
import 'package:accelerator_lesson5/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';

class LoginTextField extends StatefulWidget {
  const LoginTextField({Key? key, required this.callback}) : super(key: key);

  final PasswordCallback callback;

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {

  TextEditingController nicknameController = TextEditingController();

  @override
  void dispose() {
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).login, style: AppStyles.s14w400,),
        const SizedBox(height: 8,),
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: SvgPicture.asset(AppAssets.svg.account),
                flex: 1,
              ),
              Expanded(
                  child: TextFormField(
                    onChanged: (text) {
                      LoginScreen.of(context)?.setNickname=nicknameController.text;
                    },
                    controller: nicknameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: S.of(context).login,
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isCollapsed: true,
                    ),
                  ),
                flex: 6,
              ),
            ],
          ),

        )
      ],
    );
  }
}
