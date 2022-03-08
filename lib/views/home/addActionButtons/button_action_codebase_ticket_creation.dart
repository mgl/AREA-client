import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';
import 'package:client/models/globals.dart';

class ButtonActionCodebaseTicketCreation extends StatefulWidget {
  const ButtonActionCodebaseTicketCreation({Key? key}) : super(key: key);
  @override
  State<ButtonActionCodebaseTicketCreation> createState() =>
      _ButtonActionCodebaseTicketCreationState();
}

class _ButtonActionCodebaseTicketCreationState
    extends State<ButtonActionCodebaseTicketCreation> {
  void onClickButtonActionCodebaseTicketCreation(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Ticket creation',
            style: TextStyle(color: Colors.black)),
        content: const Text('Codebase', style: TextStyle(color: Colors.black)),
        actions: [
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  AddActionController.codebaseTicketCreation();
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
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        return TextButton(
            onPressed: () {
              onClickButtonActionCodebaseTicketCreation(context);
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
                        image: AssetImage('assets/code.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Codebase - Ticket creation')
            ]));
      }
    }
    return Container();
  }
}
