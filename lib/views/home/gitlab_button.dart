import 'package:flutter/material.dart';

class GitlabButton extends StatefulWidget {
  const GitlabButton({Key? key}) : super(key: key);
  @override
  State<GitlabButton> createState() => _GitlabButtonState();
}

class _GitlabButtonState extends State<GitlabButton> {
  bool _connectedToGitlab = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            _connectedToGitlab = (!_connectedToGitlab) ? true : false;
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
                    image: AssetImage('assets/gitlab.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToGitlab)
              ? const Text('Connect to Gitlab')
              : const Text(
                  'Connected to Gitlab',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
