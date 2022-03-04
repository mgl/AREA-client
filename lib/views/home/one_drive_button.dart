import 'package:flutter/material.dart';

class OneDriveButton extends StatefulWidget {
  const OneDriveButton({Key? key}) : super(key: key);
  @override
  State<OneDriveButton> createState() => _OneDriveButtonState();
}

class _OneDriveButtonState extends State<OneDriveButton> {
  bool _connectedToOneDrive = false;
  String answer = "";

  void onClickOneDriveLoginButton(BuildContext context) {
    AlertDialog dialog = AlertDialog(
        title: const Text('OneDrive Connection',
            style: TextStyle(color: Colors.black)),
        content: const Text('Please enter your access token.',
            style: TextStyle(color: Colors.black)),
        actions: [
          TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Token'),
              maxLines: 1,
              maxLength: 100,
              onChanged: (value) {
                setState(() {
                  answer = value;
                });
              }),
          const SizedBox(height: 10),
          Row(children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple)),
                child: const Text("Done"),
                onPressed: () {
                  setState(() {
                    _connectedToOneDrive = true;
                  });
                  Navigator.of(context).pop('OK');
                })
          ], mainAxisAlignment: MainAxisAlignment.end)
        ]);
    Future<String> futureValue = showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        }) as Future<String>;
    Stream<String> stream = futureValue.asStream();
    stream.listen((String data) {
      String answerValue = data;
      setState(() {
        answer = answerValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            if (!_connectedToOneDrive) {
              onClickOneDriveLoginButton(context);
            }
          });
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
                    image: AssetImage('assets/unnamed.png'), fit: BoxFit.cover),
                shape: BoxShape.circle),
          ),
          const SizedBox(width: 20),
          (!_connectedToOneDrive)
              ? const Text('Connect to One Drive')
              : const Text(
                  'Connected to One Drive',
                  style: TextStyle(color: Colors.green),
                ),
        ]));
  }
}
