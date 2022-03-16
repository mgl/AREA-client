import 'package:clt/controller/add_reaction_controller.dart';
import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';

class MailReactionPage extends StatefulWidget {
  const MailReactionPage({Key? key, required this.god, required this.id})
      : super(key: key);

  final God god;
  final String id;

  @override
  State<MailReactionPage> createState() => _MailReactionPageState();
}

class _MailReactionPageState extends State<MailReactionPage> {
  String objet = "";
  String toSend = "";
  String message = "";
  void onClick(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Message', style: TextStyle(color: Colors.black)),
        content: const Text('Mail', style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'email to send'),
              maxLines: 1,
              maxLength: 150,
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
              maxLength: 50,
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
              maxLength: 500,
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
                  AddReactionController.reactionMail(
                      widget.id, objet, message, toSend, widget.god);
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
      if (widget.god.globalContainer.service[i].name == 'mail') {
        return TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => onClick(context),
            child: Row(children: [
              Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/code.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle)),
              const SizedBox(width: 20),
              const Text('Mail - Message')
            ]));
      }
    }
    return Container();
  }
}
