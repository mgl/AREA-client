import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class GithubButton extends StatefulWidget {
  const GithubButton({Key? key}) : super(key: key);

  @override
  State<GithubButton> createState() => _GithubButtonState();
}

class _GithubButtonState extends State<GithubButton> {
  String answer = "";

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
                onPressed: () async {
                  await SubscribeController.subscribeGithub(answer);
                  setState(() => connectedToGithub = true);
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
      if (globalContainer.service[i].name == "github") {
        connectedToGithub = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!connectedToGithub) {
            setState(() => onClickGitHubLoginButton(context));
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
                    image: AssetImage('assets/Octocat.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!connectedToGithub)
              ? const Text('Connect to Github',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Github',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
