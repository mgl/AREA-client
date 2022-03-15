import 'package:clt/controller/add_reaction_controller.dart';
import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';

class DiscordMessageReactionPage extends StatefulWidget {
  const DiscordMessageReactionPage(
      {Key? key, required this.god, required this.id})
      : super(key: key);

  final God god;
  final String id;

  @override
  State<DiscordMessageReactionPage> createState() =>
      _DiscordMessageReactionPageState();
}

class _DiscordMessageReactionPageState
    extends State<DiscordMessageReactionPage> {
  String message = "";
  String server = "";
  String channel = "";
  void onClick(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Message', style: TextStyle(color: Colors.black)),
        content: const Text('Discord', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Server'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) {
                setState(() {
                  server = value;
                });
              }),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Channel'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) => setState(() => channel = value)),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Server'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              }),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                onPressed: () {
                  AddReactionController.reactionDiscord(
                      widget.id, message, server, channel, widget.god);
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
      if (widget.god.globalContainer.service[i].name == 'discord') {
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
              const Text('Discord - Message')
            ]));
      }
    }
    return Container();
  }
}
