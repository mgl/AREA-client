import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';
import 'package:client/models/action_container.dart';



class ButtonActionCodebaseTicketUpdate extends StatefulWidget {
  ButtonActionCodebaseTicketUpdate({Key? key, required this.globalContainer}) : super(key: key);
  ActionContainer globalContainer;
  @override
  State<ButtonActionCodebaseTicketUpdate> createState() =>
      _ButtonActionCodebaseTicketUpdateState();
}

class _ButtonActionCodebaseTicketUpdateState
    extends State<ButtonActionCodebaseTicketUpdate> {
  void onClickButtonActionCodebaseTicketUpdate(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title:
            const Text('Ticket update', style: TextStyle(color: Colors.black)),
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
                  AddActionController.codebaseTicketUpdate();
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.globalContainer.service.length; i++) {
      if (widget.globalContainer.service[i].name == "codebase") {
        return TextButton(
            onPressed: () => onClickButtonActionCodebaseTicketUpdate(context),
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
              const Text('Codebase - Ticket update')
            ]));
      }
    }
    return Container();
  }
}
