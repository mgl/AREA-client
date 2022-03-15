import 'package:flutter/material.dart';
import 'package:clt/controller/subscribe_controller.dart';
import 'package:clt/views/home/home.dart';

class GitlabButton extends StatefulWidget {
  const GitlabButton({Key? key, required this.god}) : super(key: key);
  final God god;

  @override
  State<GitlabButton> createState() => _GitlabButtonState();
}

class _GitlabButtonState extends State<GitlabButton> {
  String answer = "";

  void onClickGitlabLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Gitlab Connection',
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
                  SubscribeController.subscribeGitlab(answer, widget.god);
                  setState(() => widget.god.connectedToGitlab = true);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "gitlab") {
        widget.god.connectedToGitlab = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!widget.god.connectedToGitlab) {
            setState(() => onClickGitlabLoginButton(context));
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
                    image: AssetImage('assets/gitlab.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!widget.god.connectedToGitlab)
              ? const Text('Connect to Gitlab',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Gitlab',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
