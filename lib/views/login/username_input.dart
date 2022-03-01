/*import 'package:flutter/material.dart';

class UsernameInput extends StatelessWidget {
  final double? maxWidth;

  final TextEditingController usernameController;
  const UsernameInput(
      {Key? key, this.maxWidth, required this.usernameController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
            child: TextField(
                textInputAction: TextInputAction.next,
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'))));
  }
}
*/