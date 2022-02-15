import 'package:client/app.dart';
import 'package:client/layout/adaptive.dart';
import 'package:client/layout/text_scale.dart';
import 'package:client/views/login/login_button.dart';
import 'package:client/views/login/password_input.dart';
import 'package:client/views/login/thumb_button.dart';
import 'package:client/views/login/topbar.dart';
import 'package:client/views/login/username_input.dart';
import 'package:client/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginMainView extends StatelessWidget {
  final TextEditingController usernameController;

  final TextEditingController passwordController;

  const LoginMainView(
      {Key? key,
      required this.usernameController,
      required this.passwordController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    final auth = FirebaseAuth.instance;

    List<Widget> listViewChildren;

    if (isDesktop) {
      final desktopMaxWidth = 400.0 + 100.0 * (cappedTextScale(context) - 1);
      listViewChildren = [
        UsernameInput(
            usernameController: usernameController, maxWidth: desktopMaxWidth),
        const SizedBox(height: 12),
        PasswordInput(
            maxWidth: desktopMaxWidth, passwordController: passwordController),
        LoginButton(maxWidth: desktopMaxWidth, onTap: () => _login(context))
      ];
    } else {
      listViewChildren = [
        UsernameInput(usernameController: usernameController),
        const SizedBox(height: 12),
        PasswordInput(passwordController: passwordController),
        ThumbButton(onTap: () => _login(context))
      ];
    }
    return Column(children: [
      if (isDesktop) const TopBar(),
      Expanded(
          child: Align(
              alignment: isDesktop ? Alignment.center : Alignment.topCenter,
              child: ListView(
                  restorationId: 'login_list_view',
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: listViewChildren)))
    ]);
  }

  Future _login(BuildContext context) async {
    User? user = await EPAuthentication.signInUsingEmailPassword(
      context: context,
      email: usernameController.text,
      password: passwordController.text,
    );
    Navigator.of(context).restorablePushNamed(AreaApp.homeRoute);
  }
}
