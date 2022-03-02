import 'package:flutter/material.dart';

class OneDriveButton extends StatefulWidget {
  const OneDriveButton({Key? key}) : super(key: key);
  @override
  State<OneDriveButton> createState() => _OneDriveButtonState();
}

class _OneDriveButtonState extends State<OneDriveButton> {
  bool _connectedToOneDrive = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            _connectedToOneDrive = (!_connectedToOneDrive) ? true : false;
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
