import 'package:accelerator_lesson5/constants/app_assets.dart';
import 'package:accelerator_lesson5/constants/app_colors.dart';
import 'package:accelerator_lesson5/constants/app_styles.dart';
import 'package:accelerator_lesson5/screen/characters/characters_screen.dart';
import 'package:accelerator_lesson5/screen/login/widget/login_text_field.dart';
import 'package:accelerator_lesson5/screen/login/widget/password_text_field.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

typedef PasswordCallback = void Function(String val);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  static _LoginScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_LoginScreenState>();
}

class _LoginScreenState extends State<LoginScreen> {

  String _nickname = "Not set yet";
  String _password = "Not set yet";

  set setNickname(String value) => setState(() => _nickname = value);
  set setPassword(String value) => setState(() => _password = value);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.46,
                child: Image.asset(AppAssets.images.logo),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  LoginTextField(callback: (val) => setState(() => _nickname = val)),
                  const SizedBox(
                    height: 10,
                  ),
                  PasswordTextField(callback: (val) => setState(() => _password = val)),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: double.infinity,
                    height: 48,
                    child: MaterialButton(
                      onPressed: () {
                        if (_nickname == 'Rick Sanchez' &&
                            _password == 'rick') {
                          FocusScope.of(context).unfocus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CharactersScreen(),
                            ),
                          );
                        } else {
                          showDialog(builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              clipBehavior: Clip.hardEdge,
                                backgroundColor: Colors.white,
                                insetPadding: const EdgeInsets.symmetric(horizontal: 28),
                                child: Stack(
                                  clipBehavior: Clip.none, alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.height * 0.26,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(S.of(context).tryAgain, style: AppStyles.s20w500,),
                                          const SizedBox(height: 20,),
                                          Text(S.of(context).checkNicknameAndPassword, style: AppStyles.s14w400,),
                                          const SizedBox(height: 24,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 69,
                                            child: OutlinedButton(
                                              style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))), side: MaterialStateProperty.all(BorderSide(color: AppColors.lightBlue))),
                                                onPressed: Navigator.of(context).pop,
                                                child: Text(
                                                  S.of(context).close,
                                                  style: const TextStyle(
                                                      color: AppColors.lightBlue),)
                                                        ),
                                          ),
                                        ],
                                      )
                                    ),
                                  ],
                                )
                            );
                          }, context: context);
                        }
                      },
                      child: Center(
                        child: Text(
                          S.of(context).signIn,
                          style:
                              AppStyles.s16w400.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(S.of(context).noAccount),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        child: Text(
                          S.of(context).create,
                          style: AppStyles.s14w400
                              .copyWith(color: AppColors.lightGreen),
                        ),
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
