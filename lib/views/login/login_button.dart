import 'package:client/colors.dart';
import 'package:client/views/login/filled_button.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final double? maxWidth;

  final VoidCallback onTap;
  const LoginButton({
    Key? key,
    required this.onTap,
    this.maxWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(children: [
              const Icon(Icons.check_circle_outline,
                  color: ClientColors.buttonColor),
              const SizedBox(width: 12),
              const Text('Remember me'),
              const Expanded(child: SizedBox.shrink()),
              FilledButton(text: 'Login', onTap: onTap)
            ])));
  }
}
