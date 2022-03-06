import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';

class ButtonActionGitlabIssue extends StatefulWidget {
  const ButtonActionGitlabIssue({Key? key}) : super(key: key);
  @override
  State<ButtonActionGitlabIssue> createState() =>
      _ButtonActionGitlabIssueState();
}

class _ButtonActionGitlabIssueState extends State<ButtonActionGitlabIssue> {
  String repoId = "";
  void onClickButtonActionGitlabIssue(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Issue', style: TextStyle(color: Colors.black)),
        content: const Text('Gitlab', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'RepoID'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) {
                setState(() {
                  repoId = value;
                });
              }),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  AddActionController.GitlabIssues(repoId);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onClickButtonActionGitlabIssue(context);
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
                    image: AssetImage('assets/gitlab.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          const Text('Gitlab - Issue')
        ]));
  }
}
