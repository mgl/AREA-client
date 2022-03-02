// import 'package:client/layout/adaptive.dart';
// import 'package:client/layout/text_scale.dart';
import 'package:client/controller/auth_controller.dart';
import 'package:client/views/home/action_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _connectedToGoogle = false;
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
    final drawerItems = ListView(children: [
      drawerHeader,
      TextButton(
          onPressed: () {
            setState(() {
              _connectedToGoogle = (!_connectedToGoogle) ? true : false;
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
                      image: AssetImage('assets/google.jpg'),
                      fit: BoxFit.cover),
                  shape: BoxShape.circle),
            ),
            const SizedBox(width: 20),
            (!_connectedToGoogle)
                ? const Text('Connect to Google')
                : const Text(
                    'Connected to Google',
                    style: TextStyle(color: Colors.green),
                  ),
          ]))
    ]);
    return Scaffold(
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: Drawer(child: drawerItems));
  }
}
