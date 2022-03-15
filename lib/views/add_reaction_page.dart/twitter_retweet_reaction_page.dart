import 'package:client/controller/add_reaction_controller.dart';
import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';

class TwitterRetweetReactionPage extends StatefulWidget {
  const TwitterRetweetReactionPage(
      {Key? key,
      required this.god,
      required this.id})
      : super(key: key);

  final God god;
  final String id;

  @override
  State<TwitterRetweetReactionPage> createState() =>
      _TwitterRetweetReactionPageState();
}

class _TwitterRetweetReactionPageState
    extends State<TwitterRetweetReactionPage> {
  String postID = '';
  void onClick(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Retweet', style: TextStyle(color: Colors.black)),
        content: const Text('Twitter\n\nPost to retweet',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'ID of the post'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => postID = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: () {
                  AddReactionController.reactionTwitterRetweet(
                      widget.id, postID, widget.god);
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
              const Text('Twitter - Retweet')
            ]));
      }
    }
    return Container();
  }
}
