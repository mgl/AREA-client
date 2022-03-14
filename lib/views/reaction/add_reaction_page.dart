import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';

class AddReactionPage extends StatefulWidget {
  const AddReactionPage({Key? key, required this.id, required this.god, required this.globalToken})
      : super(key: key);

  final String id;
  final God god;
  final String globalToken;

  @override
  State<AddReactionPage> createState() => _AddReactionPageState();
}

class _AddReactionPageState extends State<AddReactionPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
