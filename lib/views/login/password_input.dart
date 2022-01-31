import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  final double? maxWidth;

  final TextEditingController passwordController;
  const PasswordInput({
    Key? key,
    this.maxWidth,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true)));
  }
}
