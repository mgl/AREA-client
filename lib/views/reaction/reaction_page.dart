
import 'package:flutter/material.dart';

class ReactionPage extends StatefulWidget {
  @override
  _ReactionPageState createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {
  // const ReactionPage({Key? key}) : super(key: key);
  final _values = List<bool?>.filled(51, false);

  @override
  Widget build(BuildContext context) {
    // for (int j = 0; j < 51; j++) {
    // _values.add(false);
    // }
    return Scaffold(
        appBar: AppBar(title: const Text('Reaction List')),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
              child: ListView(
                children: [
                  for (int i = 1; i < 51; i++)
                    CheckboxListTile(
                        title: const Text('Reaction'),
                        subtitle: const Text('Service'),
                        secondary: const Icon(Icons.code),
                        autofocus: false,
                        activeColor: Colors.green,
                        checkColor: Colors.white,
                        selected: _values[i]!,
                        value: _values[i],
                        onChanged: (bool? value) {
                          setState(() {
                            _values[i] = value;
                          });
                        })
                ],
              ),
            )));
  }
}
