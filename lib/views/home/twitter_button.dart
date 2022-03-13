import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class TwitterButton extends StatefulWidget {
  const TwitterButton({Key? key}) : super(key: key);
  @override
  State<TwitterButton> createState() => _TwitterButtonState();
}

class _TwitterButtonState extends State<TwitterButton> {
  String appToken = "";
  String appSecret = "";
  String userToken = "";
  String userSecret = "";

  void onClickTwitterLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Twitter Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your informations.',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'App Token'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => appToken = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'App Secret'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => appSecret = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Token'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => userToken = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Secret'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => userSecret = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () async {
                  await SubscribeController.subscribeTwitter(
                      appToken, userToken, userToken, userSecret);
                  setState(() => connectedToTwitter = true);
                  Navigator.of(context).pop(context);
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "twitter") {
        connectedToTwitter = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!connectedToTwitter) {
            setState(() => onClickTwitterLoginButton(context));
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
                      image: AssetImage('assets/twitter-logo.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle)),
          const SizedBox(width: 20),
          (!connectedToTwitter)
              ? const Text('Connect to Twitter',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Twitter',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
