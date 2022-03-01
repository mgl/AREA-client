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
              const SizedBox(width: 12),
              const Expanded(child: SizedBox.shrink()),
              FilledButton(text: "sign in", onTap: onTap),
              const Spacer(),
              FilledButton(text: "sign up", onTap: onTap2)
            ])));
  }
}


