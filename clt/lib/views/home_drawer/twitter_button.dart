import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';

class TwitterButton extends StatefulWidget {
  const TwitterButton({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<TwitterButton> createState() => _TwitterButtonState();
}

class _TwitterButtonState extends State<TwitterButton> {
  String accessToken = "";
  String appKeyToken = "";
  String accessPassword = "";
  String appPassword = "";

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
                  border: OutlineInputBorder(), labelText: 'accessToken'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => accessToken = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'accessPassword'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => accessPassword = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Appkey'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => appKeyToken = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'API Secret'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => appPassword = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () async {
                  SubscribeController.subscribeTwitter(accessToken,
                      accessPassword, appKeyToken, appPassword, widget.god);
                  setState(() => widget.god.connectedToTwitter = true);
                  Navigator.of(context).pop(context);
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void unSubsribe() {
    SubscribeController.unsubscribeTwitter(widget.god);
    widget.god.connectedToTwitter = false;
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
          if (widget.god.connectedToTwitter) {
            unSubsribe();
          } else if (!widget.god.connectedToTwitter) {
            onClickTwitterLoginButton(context);
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
