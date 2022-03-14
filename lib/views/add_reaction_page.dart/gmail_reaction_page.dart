import 'package:client/controller/add_reaction_controller.dart';
import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';

class GmailReactionPage extends StatefulWidget {
  const GmailReactionPage(
      {Key? key,
      required this.globalToken,
      required this.god,
      required this.id})
      : super(key: key);

  final God god;
  final String globalToken;
  final String id;

  @override
  State<GmailReactionPage> createState() => _GmailReactionPageState();
}

class _GmailReactionPageState extends State<GmailReactionPage> {
  String objet = "";
  String toSend = "";
  String message = "";
  void onClick(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Message', style: TextStyle(color: Colors.black)),
        content: const Text('Gmail', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'email to send'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) {
                setState(() {
                  toSend = value;
                });
              }),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Object'),
              maxLines: 1,
              maxLength: 25,
              onChanged: (value) {
                setState(() {
                  objet = value;
                });
              }),
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Message'),
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
                  AddReactionController.reactionMail(widget.id, objet, message,
                      toSend, widget.god, widget.globalToken);
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
      if (widget.god.globalContainer.service[i].name == 'gmail') {
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
              const Text('Gmail - Message')
            ]));
      }
    }
    return Container();
  }
}
