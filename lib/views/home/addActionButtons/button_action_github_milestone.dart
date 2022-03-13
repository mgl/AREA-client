import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';
import 'package:client/models/action_container.dart';


class ButtonActionGithubMilestone extends StatefulWidget {
  ButtonActionGithubMilestone({Key? key, required this.globalContainer}) : super(key: key);
  ActionContainer globalContainer;

  @override
  State<ButtonActionGithubMilestone> createState() =>
      _ButtonActionGithubMilestoneState();
}

class _ButtonActionGithubMilestoneState
    extends State<ButtonActionGithubMilestone> {
  String repo = "";
  String owner = "";
  void onClickButtonActionGithubMilestone(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Milestone', style: TextStyle(color: Colors.black)),
        content: const Text('Github', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Repository'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => repo = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Owner'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => owner = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  AddActionController.githubMilestone(repo, owner);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.globalContainer.service.length; i++) {
      if (widget.globalContainer.service[i].name == "github") {
        return TextButton(
            onPressed: () {
              onClickButtonActionGithubMilestone(context);
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
                          image: AssetImage('assets/Octocat.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle)),
              const SizedBox(width: 20),
              const Text('Github - Milestone')
            ]));
      }
    }
    return Container();
  }
}
