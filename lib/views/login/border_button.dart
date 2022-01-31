import 'package:client/app.dart';
import 'package:client/colors.dart';
import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String text;

  const BorderButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            primary: Colors.white,
            side: const BorderSide(color: ClientColors.buttonColor),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: () =>
            Navigator.of(context).restorablePushNamed(AreaApp.homeRoute),
        child: Text(text));
  }
}
