import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class GoogleButton extends StatefulWidget {
  GoogleButton({Key? key}) : super(key: key);
  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  String answer = "";
  void onClickGoogleLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Google Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your access token.',
            style: TextStyle(color: Colors.black)),
        actions: [
          if (!connectedToGoogle)
            TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Token'),
                maxLines: 1,
                maxLength: 100,
                onChanged: (value) => setState(() => answer = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () async {
                  await SubscribeController.subscribeGoogle(answer);
                  setState(() => connectedToGoogle = true);
                  Navigator.of(context).pop(context);
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "google") {
        connectedToGoogle = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!connectedToGoogle) {
            setState(() => onClickGoogleLoginButton(context));
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
                    image: AssetImage('assets/google.jpg'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!connectedToGoogle)
              ? const Text('Connect to Google',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Google',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
