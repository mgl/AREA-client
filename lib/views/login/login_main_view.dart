import 'package:client/layout/adaptive.dart';
import 'package:client/layout/text_scale.dart';
import 'package:client/views/login/login_button.dart';
import 'package:client/views/login/password_input.dart';
import 'package:client/views/login/topbar.dart';
import 'package:client/views/login/username_input.dart';
import 'package:client/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:client/views/login/google_button.dart';

class LoginMainView extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginMainView(
      {Key? key,
      required this.usernameController,
      required this.passwordController})
      : super(key: key);

  void _login(BuildContext context) {
    EPAuthentication.signInUsingEmailPassword(
      context: context,
      email: usernameController.text,
      password: passwordController.text,
    );
  }

  void _signInWithGoogle(BuildContext context, bool isOnMobile) {
    EPAuthentication.signInWithGoogle(context: context, IsOnMobile: isOnMobile);
  }

  void _signup(BuildContext context) {
    EPAuthentication.registerUsingEmailPassword(
      context: context,
      email: usernameController.text,
      password: passwordController.text,
    );
  }

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);

    List<Widget> listViewChildren;

    if (isDesktop) {
      final desktopMaxWidth = 400.0 + 100.0 * (cappedTextScale(context) - 1);
      listViewChildren = [
        UsernameInput(
            usernameController: usernameController, maxWidth: desktopMaxWidth),
        const SizedBox(height: 12),
        PasswordInput(
            maxWidth: desktopMaxWidth, passwordController: passwordController),
        GoogleButton(
            onTap: () => _signInWithGoogle(context, false), maxWidth: desktopMaxWidth),
        LoginButton(
          maxWidth: desktopMaxWidth,
          onTap: () => _login(context),
          onTap2: () => _signup(context),
        )
      ];
    } else {
      final screenMaxWidth = 400.0 + (cappedTextScale(context) - 1);
      listViewChildren = [
        const SizedBox(height: 30),
        UsernameInput(usernameController: usernameController),
        const SizedBox(height: 12),
        PasswordInput(passwordController: passwordController),
        GoogleButton(onTap: () => _signInWithGoogle(context, true)),
        LoginButton(
          maxWidth: screenMaxWidth,
          onTap: () => _login(context),
          onTap2: () => _signup(context),
        )
      ];
    }

    return Column(children: [
      const TopBar(),
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
}
