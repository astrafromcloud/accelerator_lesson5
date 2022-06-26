import 'package:accelerator_lesson5/constants/app_assets.dart';
import 'package:accelerator_lesson5/constants/app_colors.dart';
import 'package:accelerator_lesson5/constants/app_styles.dart';
import 'package:accelerator_lesson5/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/l10n.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, required this.callback}) : super(key: key);

  final PasswordCallback callback;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool _passwordVisible = true;

  @override
  void initState() {
    _passwordVisible = true;
    super.initState();
  }

  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).password, style: AppStyles.s14w400,),
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
                child: SvgPicture.asset(AppAssets.svg.password),
                flex: 1,
              ),
              Expanded(
                  child: TextFormField(
                    style: const TextStyle(letterSpacing: 10),
                    obscureText: _passwordVisible,
                    onChanged: (text) {
                      LoginScreen.of(context)?.setPassword=passwordController.text;
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffix: passwordController.text.isNotEmpty ? IconButton(
                        splashRadius: 10,
                        icon: Icon(
                          _passwordVisible ?
                          Icons.visibility_off : Icons.visibility,
                          color: AppColors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ) : null,
                      border: InputBorder.none,
                      labelText: S.of(context).password,
                      labelStyle: const TextStyle(letterSpacing: 0),
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