import 'package:client/models/globals.dart';
import 'package:flutter/material.dart';

class ButtonActionCodebaseMergeRequest extends StatefulWidget {
  const ButtonActionCodebaseMergeRequest({Key? key}) : super(key: key);
  @override
  State<ButtonActionCodebaseMergeRequest> createState() =>
      _ButtonActionCodebaseMergeRequestState();
}

class _ButtonActionCodebaseMergeRequestState
    extends State<ButtonActionCodebaseMergeRequest> {
  void onClickButtonActionCodebaseMerge(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title:
            const Text('Merge request', style: TextStyle(color: Colors.black)),
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
    return TextButton(
        onPressed: () {
          onClickButtonActionCodebaseMerge(context);
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
                    image: AssetImage('assets/code.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          const Text('Codebase - Merge request')
        ]));
  }
}
