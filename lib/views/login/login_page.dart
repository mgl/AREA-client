import 'package:client/layout/client_options.dart';
import 'package:client/views/login/login_main_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with RestorationMixin {
  final RestorableTextEditingController _usenameController =
      RestorableTextEditingController();
  final RestorableTextEditingController _passwordController =
      RestorableTextEditingController();
  @override
  String get restorationId => 'login_page';

  @override
  Widget build(BuildContext context) {
    return ApplyTextOptions(
        child: Scaffold(
            body: SafeArea(
                child: LoginMainView(
                    usernameController: _usenameController.value,
                    passwordController: _passwordController.value))));
  }

  @override
  void dispose() {
    _usenameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_usenameController, restorationId);
    registerForRestoration(_passwordController, restorationId);
  }
}
