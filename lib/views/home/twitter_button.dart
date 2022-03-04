import 'package:flutter/material.dart';

class TwitterButton extends StatefulWidget {
  const TwitterButton({Key? key}) : super(key: key);
  @override
  State<TwitterButton> createState() => _TwitterButtonState();
}

class _TwitterButtonState extends State<TwitterButton> {
  bool _connectedToTwitter = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            _connectedToTwitter = (!_connectedToTwitter) ? true : false;
          });
        },
        style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Row(children: [
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/twitter-logo.jpg'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToTwitter)
              ? const Text('Connect to Twitter')
              : const Text(
                  'Connected to Twitter',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
