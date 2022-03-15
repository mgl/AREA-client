import 'package:client/controller/add_reaction_controller.dart';
import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';

class TwitterFollowUserReactionPage extends StatefulWidget {
  const TwitterFollowUserReactionPage(
      {Key? key,
      required this.god,
      required this.id})
      : super(key: key);

  final God god;
  final String id;

  @override
  State<TwitterFollowUserReactionPage> createState() =>
      _TwitterFollowUserReactionPageState();
}

class _TwitterFollowUserReactionPageState
    extends State<TwitterFollowUserReactionPage> {
  String user = "";
  void onClick(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Follow User', style: TextStyle(color: Colors.black)),
        content: const Text('Twitter\n\nUser to follow',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User to follow'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => user = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: () {
                  AddReactionController.reactionTwitterFollow(
                      widget.id, user, widget.god);
                  Navigator.of(context).pop('Done');
                },
                child: const Text('Done')),
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == 'twitter') {
        return TextButton(
            onPressed: () => onClick(context),
            child: Row(children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/code.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle)),
              const SizedBox(width: 20),
              const Text('Twitter - Follow User')
            ]));
      }
    }
    return Container();
  }
}
