import 'package:flutter/material.dart';
// import 'package:client/secret_key.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class GithubButton extends StatefulWidget {
  const GithubButton({Key? key}) : super(key: key);

  @override
  State<GithubButton> createState() => _GithubButtonState();
}

class _GithubButtonState extends State<GithubButton> {
  bool _connectedToGithub = false;
  String answer = "";
  String userName = "";

  void onClickGitHubLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Github Connection',
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
                    if (_connectedToGithub == true) {
                      SubscribeController.unsubscribeGithub();
                      _connectedToGithub = false;
                    } else {
                      SubscribeController.subscribeGithub(answer);
                      _connectedToGithub = true;
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
    if (globalContainer.service.isEmpty) {
      return Container();
    }
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        _connectedToGithub = true;
      }
    }
    return TextButton(
        onPressed: () => setState(() {
              if (!_connectedToGithub) {
                onClickGitHubLoginButton(context);
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
                    image: AssetImage('assets/Octocat.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToGithub)
              ? const Text('Connect to Github')
              : const Text('Connected to Github',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
