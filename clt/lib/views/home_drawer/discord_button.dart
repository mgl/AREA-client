import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscordButton extends StatefulWidget {
  const DiscordButton({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<DiscordButton> createState() => _DiscordButtonState();
}

class _DiscordButtonState extends State<DiscordButton> {
  String answer = "";

  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => setState(() {}));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void invitDiscord() async {
    const String url =
        'https://discord.com/oauth2/authorize?client_id=950800074328391711&scope=bot&permissions=2048';
    await launch(url);
  }

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
                  setState(() => widget.god.connectedToDiscord = true);
                  invitDiscord();
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void unSubsribe() {
    SubscribeController.unsubscribeDiscord(widget.god);
    widget.god.connectedToDiscord = false;
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
          if (widget.god.connectedToDiscord) {
            unSubsribe();
          }
          else if (!widget.god.connectedToDiscord) {
            onClickDiscordLoginButton(context);
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
