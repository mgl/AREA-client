import 'package:client/colors.dart';
import 'package:flutter/material.dart';

class FilledButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  const FilledButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: ClientColors.buttonColor,
            primary: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        onPressed: onTap,
        child: Row(children: [
          const Icon(Icons.lock),
          const SizedBox(width: 6),
          Text(text)
        ]));
  }
}
