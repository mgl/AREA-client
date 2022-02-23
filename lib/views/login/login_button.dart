import 'package:client/colors.dart';
import 'package:client/views/login/filled_button.dart';
import 'package:flutter/material.dart';
import 'package:client/views/login/border_button.dart';
import 'package:client/views/login/login_main_view.dart';

class LoginButton extends StatelessWidget {
  final double? maxWidth;

  final VoidCallback onTap;
  final VoidCallback onTap2;
  const LoginButton({
    Key? key,
    required this.onTap,
    required this.onTap2,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              const Icon(Icons.check_circle_outline,
                  color: ClientColors.buttonColor),
              const SizedBox(width: 12),
              const Text('Remember me'),
              const Expanded(child: SizedBox.shrink()),
              FilledButton(text: "sign in", onTap: onTap),
              const Spacer(),
              FilledButton(text: "sign up", onTap: onTap2)
            ])));
  }
}

class GoogleButton extends StatelessWidget {
  final double? maxWidth;
  final VoidCallback onTap;
  const GoogleButton({Key? key, required this.onTap, this.maxWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            padding: const EdgeInsets.only(top: 12),
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                onPressed: onTap,
                child: Row(children: [
                  Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/google.jpg'),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle)),
                  const SizedBox(width: 20),
                  const Text("Sign In With Google")
                ]))));
  }
}
