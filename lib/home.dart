import 'package:client/layout/adaptive.dart';
import 'package:client/layout/text_scale.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = isDisplayDesktop(context);
    const drawerHeader = UserAccountsDrawerHeader(
        accountName: Text('name'),
        accountEmail: Text('email@test.com'),
        currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/epilogo.png'),
            backgroundColor: Colors.black87));
    final drawerItems = ListView(children: [
      drawerHeader,
      ListTile(
          title: const Text('data'),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          }),
      ListTile(
          title: const Text('data'),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          })
    ]);
    return Scaffold(
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Text('Work In Progress'))),
        drawer: Drawer(child: drawerItems));
  }
}
