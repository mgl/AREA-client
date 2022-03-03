import 'package:flutter/material.dart';
// import 'package:client/secret_key.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class GithubButton extends StatefulWidget {
  const GithubButton({Key? key}) : super(key: key);

  @override
  State<GithubButton> createState() => _GithubButtonState();
}

class _GithubButtonState extends State<GithubButton> {
  bool _connectedToGithub = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> onClickGitHubLoginButton() async {

  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            if (!_connectedToGithub) {
              onClickGitHubLoginButton();
            }
            _connectedToGithub = true;
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
                    image: AssetImage('assets/Octocat.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToGithub)
              ? const Text('Connect to Github')
              : const Text(
                  'Connected to Github',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
