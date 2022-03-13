import 'package:client/models/globals.dart';
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
  HomeDrawer({Key? key, required this.oui}) : super(key: key);
  bool oui;
  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    UserAccountsDrawerHeader drawerHeader = UserAccountsDrawerHeader(
        accountName: Text(
            (FirebaseAuth.instance.currentUser!.displayName != null)
                ? FirebaseAuth.instance.currentUser!.displayName as String
                : (FirebaseAuth.instance.currentUser!.email as String)
                    .split('@')
                    .first),
        accountEmail: Text(FirebaseAuth.instance.currentUser!.email as String),
        currentAccountPicture: CircleAvatar(
            backgroundImage:
                (FirebaseAuth.instance.currentUser!.displayName != null)
                    ? NetworkImage(
                        FirebaseAuth.instance.currentUser?.photoURL as String)
                    : const AssetImage('assets/epilogo.png') as ImageProvider,
            backgroundColor: const Color(0xFF33333D)));
    final drawerItems = ListView(children: [
      drawerHeader,
      GoogleButton(),
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
      const LogOutButton()
    ]);
    return drawerItems;
  }
}
