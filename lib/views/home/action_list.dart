import 'package:client/views/reaction/reaction_page.dart';
import 'package:flutter/material.dart';

class ActionList extends StatelessWidget {
  const ActionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Action List'), automaticallyImplyLeading: false),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
                child: ListView(
                    restorationId: 'ActionList',
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: [
                  for (int index = 1; index < 51; index++)
                    ListTile(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return const ReactionPage();
                          }));
                        },
                        leading: ExcludeSemantics(
                            child: CircleAvatar(child: Text('$index'))),
                        title: Text('Action n°$index'),
                        subtitle: const Text('Service'))
                ]))));
  }
}
