import 'package:flutter/material.dart';

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