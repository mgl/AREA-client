import 'package:client/models/globals.dart';
import 'package:client/views/reaction/reaction_page.dart';
import 'package:flutter/material.dart';

class ActionList extends StatefulWidget {
  const ActionList({Key? key}) : super(key: key);

  @override
  State<ActionList> createState() => _ActionListState();
}

class _ActionListState extends State<ActionList> {
  List<ListTile> list = [];

  List<ListTile> getAllActions() {
    List<ListTile> actionList = [];
    for (int i = 0;
        i < globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Merge request'),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0; i < globalContainer.actionCodebasePush.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0;
        i < globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Ticket creation'),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0;
        i < globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Ticket update'),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0; i < globalContainer.actionGithubIssueComment.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue comment'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGithubIssue.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGithubLabel.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Label'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGithubMilestone.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Milestone'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGithubPullRequest.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Pull request'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGithubPush.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < globalContainer.actionGitlabComment.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Comment'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < globalContainer.actionGitlabIssue.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < globalContainer.actionGitlabPush.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0;
        i < globalContainer.actionGitlabMergeRequest.length;
        i++) {}
    for (int i = 0; i < globalContainer.actionGitlabWiki.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return const ReactionPage();
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Merge request'),
          subtitle: const Text('Gitlab')));
    }
    return actionList;
  }

  @override
  Widget build(BuildContext context) {
    list = getAllActions();
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
                    children: list))));
  }
}
