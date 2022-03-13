import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/views/home/home.dart';


class TwitterButton extends StatefulWidget {
  const TwitterButton(
      {Key? key,
      required this.globalToken,
      required this.god})
      : super(key: key);
  final God god;
  final String globalToken;
  @override
  State<TwitterButton> createState() => _TwitterButtonState();
}

class _TwitterButtonState extends State<TwitterButton> {
  String bearerToken = "";

  void onClickTwitterLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Twitter Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your Beerer token',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: ''),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => bearerToken = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () async {
                   SubscribeController.subscribeTwitter(
                      bearerToken,
                      widget.globalToken,
                      widget.god);
                  setState(() => widget.god.connectedToTwitter = true);
                  Navigator.of(context).pop(context);
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "twitter") {
        widget.god.connectedToTwitter = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!widget.god.connectedToTwitter) {
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
          (!widget.god.connectedToTwitter)
              ? const Text('Connect to Twitter',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Twitter',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
