import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:client/controller/add_action_controller.dart';

class ButtonActionCodebasePush extends StatefulWidget {
  const ButtonActionCodebasePush(
      {Key? key, required this.god, required this.globalToken})
      : super(key: key);
  final God god;
  final String globalToken;
  @override
  State<ButtonActionCodebasePush> createState() =>
      _ButtonActionCodebasePushState();
}

class _ButtonActionCodebasePushState extends State<ButtonActionCodebasePush> {
  void onClickButtonActionCodebasePush(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Push', style: TextStyle(color: Colors.black)),
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
                  AddActionController.codebasePush(
                      widget.globalToken, widget.god);
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
            onPressed: () => onClickButtonActionCodebasePush(context),
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
              const Text('Codebase - Push')
            ]));
      }
    }
    return Container();
  }
}
