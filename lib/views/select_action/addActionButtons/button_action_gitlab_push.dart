import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';
import 'package:client/views/home/home.dart';

class ButtonActionGitlabPush extends StatefulWidget {
  const ButtonActionGitlabPush(
      {Key? key, required this.god})
      : super(key: key);
  final God god;

  @override
  State<ButtonActionGitlabPush> createState() => _ButtonActionGitlabPushState();
}

class _ButtonActionGitlabPushState extends State<ButtonActionGitlabPush> {
  String repoId = "";
  void onClickButtonActionGitlabPush(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Push', style: TextStyle(color: Colors.black)),
        content: const Text('Gitlab', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'RepoID'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => repoId = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  AddActionController.gitlabPush(
                      repoId, widget.god);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "gitlab") {
        return TextButton(
            onPressed: () => onClickButtonActionGitlabPush(context),
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
                          image: AssetImage('assets/gitlab.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle)),
              const SizedBox(width: 20),
              const Text('Gitlab - Push')
            ]));
      }
    }
    return Container();
  }
}
