import 'package:clt/models/action_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clt/routes.dart' as routes;
import 'package:clt/views/home/home.dart';

class LogOutButton extends StatefulWidget {
  const LogOutButton({Key? key, required this.god}) : super(key: key);
  @override
  final God god;
  State<LogOutButton> createState() => _LogOutButtonState();
}

class _LogOutButtonState extends State<LogOutButton> {
  static const String _loginRoute = routes.loginRoute;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => setState(() {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacementNamed(_loginRoute);
              widget.god.connectedToCodebase = false;
              widget.god.connectedToDiscord = false;
              widget.god.connectedToGithub = false;
              widget.god.connectedToGitlab = false;
              widget.god.connectedToTwitter = false;
              widget.god.connectedToMail = false;
              widget.god.globalContainer = GlobalContainer();
              widget.god.globalToken = "";
              widget.god.setuped = false;
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
                      image: AssetImage('assets/logout.png'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle)),
          const SizedBox(width: 20),
          const Text('logout')
        ]));
  }
}
