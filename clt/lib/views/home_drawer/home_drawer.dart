import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:clt/views/home_drawer/discord_button.dart';
import 'package:clt/views/home_drawer/github_button.dart';
import 'package:clt/views/home_drawer/gitlab_button.dart';
import 'package:clt/views/home_drawer/mail_button.dart';
import 'package:clt/views/home_drawer/codebase_button.dart';
import 'package:clt/views/home_drawer/twitter_button.dart';
import 'package:clt/views/home_drawer/logout_button.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key, required this.god}) : super(key: key);
  final God god;
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
      MailButton(god: widget.god),
      const SizedBox(height: 10),
      GithubButton(god: widget.god),
      const SizedBox(height: 10),
      GitlabButton(god: widget.god),
      const SizedBox(height: 10),
      TwitterButton(
        god: widget.god,
      ),
      const SizedBox(height: 10),
      DiscordButton(god: widget.god),
      const SizedBox(height: 10),
      CodebaseButton(god: widget.god),
      const SizedBox(height: 10),
      LogOutButton(god: widget.god)
    ]);
    return drawerItems;
  }
}
