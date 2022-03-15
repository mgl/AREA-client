import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:clt/controller/add_action_controller.dart';
import 'package:clt/models/globals.dart';

class ButtonActionCodebaseTicketCreation extends StatefulWidget {
  const ButtonActionCodebaseTicketCreation({Key? key, required this.god})
      : super(key: key);
  final God god;
  @override
  State<ButtonActionCodebaseTicketCreation> createState() =>
      _ButtonActionCodebaseTicketCreationState();
}

class _ButtonActionCodebaseTicketCreationState
    extends State<ButtonActionCodebaseTicketCreation> {
  void onClickButtonActionCodebaseTicketCreation(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Ticket Creation',
            style: TextStyle(color: Colors.black)),
        content: const Text(
            'Codebase\n\nGo to Codebase and create a webhook using this url :\n' +
                urlPrefix,
            style: TextStyle(color: Colors.black)),
        actions: [
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  AddActionController.codebaseTicketCreation(widget.god);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "codebase") {
        return TextButton(
            onPressed: () => onClickButtonActionCodebaseTicketCreation(context),
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
                          image: AssetImage('assets/code.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle)),
              const SizedBox(width: 20),
              const Text('Codebase - Ticket creation')
            ]));
      }
    }
    return Container();
  }
}
