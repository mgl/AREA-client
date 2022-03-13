import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';
import 'package:client/views/home/action_list.dart';
import 'package:client/controller/setup_controller.dart';
import 'package:client/views/home/select_action_page.dart';
import 'package:client/views/home/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:client/models/action_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  final String title = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? timer;
  String globalToken = "";
  ActionContainer globalContainer = ActionContainer();
  bool setuped = false;



  bool connectedToGitlab = false;
  bool connectedToGithub = false;
  bool connectedToCodebase = false;
  bool connectedToDiscord = false;
  bool connectedToGoogle = false;
  bool connectedToTwitter = false;


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
    setState(() {});
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

  refreshHome() => setState(() {});

  FutureOr onGoBack(dynamic value) {
    print("\nhello\n");
    setState(() {});
  }

  void navigateToSelectAction() {
    Route route = MaterialPageRoute(builder: (context) => SelectActionPage());
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: navigateToSelectAction,
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: Drawer(child: HomeDrawer(oui: connectedToGoogle)));
  }
}
