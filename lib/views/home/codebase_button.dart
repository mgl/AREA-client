import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/views/home/home.dart';


class CodebaseButton extends StatefulWidget {
  const CodebaseButton(
      {Key? key,
      required this.god,
      required this.globalToken})
      : super(key: key);
  final String globalToken;
  final God god;
  @override
  State<CodebaseButton> createState() => _CodebaseButtonState();
}

class _CodebaseButtonState extends State<CodebaseButton> {
  String answer = "";
  void onClickCodebaseLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('Codebase Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your API key.',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Username'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) => setState(() => answer = value)),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () async {
                  await SubscribeController.subscribeCodebase(
                      answer,
                      widget.globalToken,
                      widget.god);
                  setState(() => widget.god.connectedToCodebase = true);
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    Future<String> futureValue =
        showDialog(context: context, builder: (BuildContext context) => dialog)
            as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {
      String answerValue = data;
      setState(() => answer = answerValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < widget.god.globalContainer.service.length; i++) {
      if (widget.god.globalContainer.service[i].name == "codebase") {
        widget.god.connectedToCodebase = true;
      }
    }
    return TextButton(
        onPressed: () {
          if (!widget.god.connectedToCodebase) {
            setState(() => onClickCodebaseLoginButton(context));
          }
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
          (!widget.god.connectedToCodebase)
              ? const Text('Connect to Codebase',
                  style: TextStyle(color: Colors.black))
              : const Text('Connected to Codebase',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
