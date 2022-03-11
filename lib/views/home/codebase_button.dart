import 'package:flutter/material.dart';
import 'package:client/controller/subscribe_controller.dart';
import 'package:client/models/globals.dart';

class CodebaseButton extends StatefulWidget {
  const CodebaseButton({Key? key}) : super(key: key);
  @override
  State<CodebaseButton> createState() => _CodebaseButtonState();
}

class _CodebaseButtonState extends State<CodebaseButton> {
  bool _connectedToCodebase = false;
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
                onPressed: () {
                  setState(() {
                    if (_connectedToCodebase == false) {
                      SubscribeController.subscribeCodebase(answer);
                      _connectedToCodebase = true;
                    }
                  });
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
    if (globalContainer.service.isEmpty) {
      return Container();
    }
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        _connectedToCodebase = true;
      }
    }
    return TextButton(
        onPressed: () => setState(() {
              if (!_connectedToCodebase) {
                onClickCodebaseLoginButton(context);
              } else {
                SubscribeController.unsubscribeCodebase();
                _connectedToCodebase = false;
              }
            }),
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
          (!_connectedToCodebase)
              ? const Text('Connect to Codebase')
              : const Text('Connected to Codebase',
                  style: TextStyle(color: Colors.green))
        ]));
  }
}
