// import 'package:client/layout/adaptive.dart';
// import 'package:client/layout/text_scale.dart';
import 'package:client/views/home/action_list.dart';
import 'package:client/views/home/discord_button.dart';
import 'package:client/views/home/github_button.dart';
import 'package:client/views/home/gitlab_button.dart';
import 'package:client/views/home/google_button.dart';
import 'package:client/views/home/one_drive_button.dart';
import 'package:client/views/home/twitter_button.dart';
import 'package:client/views/home/logout_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final isDesktop = isDisplayDesktop(context);
    String userName = 'user';
    ImageProvider userPicture = AssetImage('assets/epilogo.png');
    if (FirebaseAuth.instance.currentUser!.displayName != null) {
      userName = FirebaseAuth.instance.currentUser!.displayName as String;
      final src = FirebaseAuth.instance.currentUser!.photoURL as String;
      userPicture = NetworkImage(src);
    }
    String userMail = FirebaseAuth.instance.currentUser!.email as String;
    UserAccountsDrawerHeader drawerHeader = UserAccountsDrawerHeader(
        accountName: Text(userName),
        accountEmail: Text(userMail),
        currentAccountPicture: CircleAvatar(
            backgroundImage: userPicture,
            backgroundColor: Color(0xFF33333D)));
    final drawerItems = ListView(children: [
      drawerHeader,
      const GoogleButton(),
      const SizedBox(height: 10),
      const GithubButton(),
      const SizedBox(height: 10),
      const GitlabButton(),
      const SizedBox(height: 10),
      const TwitterButton(),
      const SizedBox(height: 10),
      const DiscordButton(),
      const SizedBox(height: 10),
      const OneDriveButton(),
      const SizedBox(height: 10),
      const LogOutButton(),
    ]);
    return Scaffold(
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: Drawer(child: drawerItems));
  }
}
