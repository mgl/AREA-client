import 'package:client/views/home/action_list.dart';
import 'package:client/controller/setup_controller.dart';
import 'package:client/views/home/home_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SetupController.SetupArea();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: const Drawer(child: HomeDrawer()));
  }
}
