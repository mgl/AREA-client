import 'package:flutter/material.dart';

class DiscordButton extends StatefulWidget {
  const DiscordButton({Key? key}) : super(key: key);
  @override
  State<DiscordButton> createState() => _DiscordButtonState();
}

class _DiscordButtonState extends State<DiscordButton> {
  bool _connectedToDiscord = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            _connectedToDiscord = (!_connectedToDiscord) ? true : false;
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
                    image: AssetImage('assets/discord.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToDiscord)
              ? const Text('Connect to Discord')
              : const Text(
                  'Connected to Discord',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
