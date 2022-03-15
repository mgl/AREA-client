import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';

class DiscordButton extends StatefulWidget {
  const DiscordButton({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<DiscordButton> createState() => _DiscordButtonState();
}

class _DiscordButtonState extends State<DiscordButton> {
  String answer = "";

  void onClickDiscordLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Discord Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text(
            'Click on this button to add the bot on your server',
            style: TextStyle(color: Colors.black)),
        actions: [
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Invite Discord Bot"),
                onPressed: () {
                  SubscribeController.subscribeDiscord(widget.god);
                  // invit the bot
                  setState(() => widget.god.connectedToDiscord = true);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "discord") {
        widget.god.connectedToDiscord = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!widget.god.connectedToDiscord) {
            setState(() => onClickDiscordLoginButton(context));
          }
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
          (!widget.god.connectedToDiscord)
              ? const Text('Connect to Discord',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Discord',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
