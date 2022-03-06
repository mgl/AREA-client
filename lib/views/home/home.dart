import 'package:client/models/globals.dart';
import 'package:client/views/home/action_list.dart';
import 'package:client/controller/setup_controller.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_push.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_ticket_creation.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_ticket_update.dart';
import 'package:client/views/home/addActionButtons/button_action_github_issue.dart';
import 'package:client/views/home/addActionButtons/button_action_github_issue_comment.dart';
import 'package:client/views/home/addActionButtons/button_action_github_label.dart';
import 'package:client/views/home/addActionButtons/button_action_github_milestone.dart';
import 'package:client/views/home/addActionButtons/button_action_github_pull_request.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_comment.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_issue.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_merge_request.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_push.dart';
import 'package:client/views/home/addActionButtons/button_action_github_push.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_wiki.dart';
import 'package:client/views/home/select_action_page.dart';
import 'package:client/views/home/home_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_merge_request.dart';

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
      SetupController.SetupArea(token);
    }
  }

  void onClickOnAddButton(BuildContext context) {
    AlertDialog dialog = const AlertDialog(
        scrollable: true,
        actions: [

        ],
        backgroundColor: Color.fromRGBO(0, 0, 0, 0));
    Future<String> futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }) as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {});
  }

  // onTap: () {
  //   Navigator.push(context,
  //       MaterialPageRoute(builder: (BuildContext context) {
  //     return const ReactionPage();
  //   }));
  // },

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // onClickOnAddButton(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return SelectActionPage();
              }));
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
        appBar: AppBar(title: const Text('AREA PROJECT')),
        body: const Center(
            child: Padding(padding: EdgeInsets.all(50.0), child: ActionList())),
        drawer: const Drawer(child: HomeDrawer()));
  }
}
