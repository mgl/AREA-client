import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:client/views/home/discord_button.dart';
import 'package:client/views/home/github_button.dart';
import 'package:client/views/home/gitlab_button.dart';
import 'package:client/views/home/google_button.dart';
import 'package:client/views/home/codebase_button.dart';
import 'package:client/views/home/twitter_button.dart';
import 'package:client/views/home/logout_button.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    String userName = 'user';
    ImageProvider userPicture = const AssetImage('assets/epilogo.png');
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
            backgroundColor: const Color(0xFF33333D)));
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
      const CodebaseButton(),
      const SizedBox(height: 10),
      const LogOutButton(),
    ]);
    return drawerItems;
  }
}
