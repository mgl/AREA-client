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
    
    const drawerHeader = UserAccountsDrawerHeader(
        accountName: Text('name'),
        accountEmail: Text('email@test.com'),
        currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/epilogo.png'),
            backgroundColor: Color(0xFF33333D)));
    final drawerItems = ListView(children: const [
      drawerHeader,
      GoogleButton(),
      SizedBox(height: 10),
      GithubButton(),
      SizedBox(height: 10),
      GitlabButton(),
      SizedBox(height: 10),
      TwitterButton(),
      SizedBox(height: 10),
      DiscordButton(),
      SizedBox(height: 10),
      OneDriveButton(),
      SizedBox(height: 10),
      LogOutButton(),

    ]);
    return Scaffold(
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: Drawer(child: drawerItems));
  }
}
