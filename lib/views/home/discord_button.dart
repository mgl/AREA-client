import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class DiscordButton extends StatefulWidget {
  const DiscordButton({Key? key}) : super(key: key);
  @override
  State<DiscordButton> createState() => _DiscordButtonState();
}

class _DiscordButtonState extends State<DiscordButton> {
  bool _connectedToDiscord = false;
  String answer = "";

  void onClickDiscordLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Discord Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text(
            'Please enter the URL of the webhook of your server.',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Webhook URL'),
              maxLines: 1,
              maxLength: 300,
              onChanged: (value) => setState(() => answer = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  setState(() {
                    if (_connectedToDiscord == true) {
                      SubscribeController.unsubscribeDiscord();
                      _connectedToDiscord = false;
                    } else {
                      SubscribeController.subscribeDiscord(answer);
                      _connectedToDiscord = true;
                    }
                  });
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    Future<String> futureValue =
        showDialog(context: context, builder: (BuildContext context) => dialog)
            as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {
      String answerValue = data;
      setState(() => answer = answerValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "discord") {
        _connectedToDiscord = true;
      }
    }
    return TextButton(
        onPressed: () => setState(() {
              if (!_connectedToDiscord) {
                onClickDiscordLoginButton(context);
              }
            }),
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
              : const Text('Connected to Discord',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
