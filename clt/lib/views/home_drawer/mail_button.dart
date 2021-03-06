import 'dart:async';

import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';

class MailButton extends StatefulWidget {
  const MailButton({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<MailButton> createState() => _MailButtonState();
}

class _MailButtonState extends State<MailButton> {
  String userName = "";
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

  void onClickGoogleLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Mail Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your email and app password',
            style: TextStyle(color: Colors.black)),
        actions: [
          if (!widget.god.connectedToMail)
            TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Your eMail'),
                maxLines: 1,
                maxLength: 100,
                onChanged: (value) => setState(() => userName = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'AppPassword'),
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
                  SubscribeController.subscribeMail(
                      userName, appPassword, widget.god);
                  setState(() => widget.god.connectedToMail = true);
                  Navigator.of(context).pop(context);
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  void unSubsribe() {
      SubscribeController.unsubscribeMail(widget.god);
      widget.god.connectedToMail = false;
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "mail") {
        widget.god.connectedToMail = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (widget.god.connectedToMail) {
            unSubsribe();
          }
          else if (!widget.god.connectedToMail) {
            onClickGoogleLoginButton(context);
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
                    image: AssetImage('assets/gmail.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!widget.god.connectedToMail)
              ? const Text('Connect to Mail',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Mail',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
