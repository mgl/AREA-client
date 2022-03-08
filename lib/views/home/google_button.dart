import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class GoogleButton extends StatefulWidget {
  const GoogleButton({Key? key}) : super(key: key);
  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  bool _connectedToGoogle = false;
  String answer = "";
  void onClickGoogleLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Google Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your access token.',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Token'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              }),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  setState(() {
                    if (_connectedToGoogle == true) {
                      SubscribeController.unsubscribeGoogle();
                      _connectedToGoogle = false;
                    } else {
                      SubscribeController.subscribeGoogle(answer);
                      _connectedToGoogle = true;
                    }
                  });
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    Future<String> futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }) as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {
      String answerValue = data;
      setState(() {
        answer = answerValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (globalContainer.service.isEmpty) {
      return Container();
    }
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "google") {
        _connectedToGoogle = true;
      }
    }
    return TextButton(
        onPressed: () {
          setState(() {
            if (!_connectedToGoogle) {
              onClickGoogleLoginButton(context);
            }
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
                    image: AssetImage('assets/google.jpg'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToGoogle)
              ? const Text('Connect to Google')
              : const Text(
                  'Connected to Google',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
