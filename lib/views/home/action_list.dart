import 'package:client/views/reaction/reaction_page.dart';
import 'package:flutter/material.dart';

class ActionList extends StatelessWidget {
  const ActionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const Text('Action List')),
      body: Scrollbar(
          child: ListView(
        restorationId: 'ActionList',
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (int index = 1; index < 50; index++)
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return ReactionPage();
                  }));
                },
                leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('$index'))),
                title: Text('Action n°$index'),
                subtitle: const Text('Service'))
        ],
      )),
    );
  }
}
