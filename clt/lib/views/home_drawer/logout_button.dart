import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:clt/routes.dart' as routes;

class LogOutButton extends StatefulWidget {
  const LogOutButton({Key? key}) : super(key: key);
  @override
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
