import 'package:client/models/globals.dart';
import 'package:client/views/home/action_list.dart';
import 'package:client/controller/setup_controller.dart';
import 'package:client/views/home/select_action_page.dart';
import 'package:client/views/home/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (Timer t) => setup());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void setup() async {
    if (!setuped) {
      String token = await FirebaseAuth.instance.currentUser!.getIdToken();
      SetupController.setupArea(token);
    }
    setState(() {
      
    });
  }

  void onClickOnAddButton(BuildContext context) {
    AlertDialog dialog = const AlertDialog(
        scrollable: true,
        actions: [],
        backgroundColor: Color.fromRGBO(0, 0, 0, 0));
    Future<String> futureValue =
        showDialog(context: context, builder: (BuildContext context) => dialog)
            as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const SelectActionPage())),
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: const Drawer(child: HomeDrawer()));
  }
}
