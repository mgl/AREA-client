import 'dart:async';
import 'package:client/views/home/home.dart';
import 'package:client/views/reaction/action_codebase_merge_request_reaction_page.dart';
import 'package:client/views/reaction/action_codebase_push_reaction_page.dart';
import 'package:client/views/reaction/action_codebase_ticket_creation_reaction_page.dart';
import 'package:client/views/reaction/action_codebase_ticket_update_reaction_page.dart';
import 'package:client/views/reaction/action_github_issue_comment_reaction_page.dart';
import 'package:client/views/reaction/action_github_issue_reaction_page.dart';
import 'package:client/views/reaction/action_github_label_reaction_page.dart';
import 'package:client/views/reaction/action_github_milestone_reaction_page.dart';
import 'package:client/views/reaction/action_github_pull_request_reaction_page.dart';
import 'package:client/views/reaction/action_github_push_reaction_page.dart';
import 'package:client/views/reaction/action_gitlab_comment_reaction_page.dart';
import 'package:client/views/reaction/action_gitlab_issue_reaction_page.dart';
import 'package:client/views/reaction/action_gitlab_merge_request_reaction_page.dart';
import 'package:client/views/reaction/action_gitlab_push_reaction_page.dart';
import 'package:client/views/reaction/action_gitlab_wiki_reaction_page.dart';
import 'package:client/views/reaction/add_reaction_page.dart';
import 'package:flutter/material.dart';

class ActionList extends StatefulWidget {
  const ActionList({Key? key, required this.god}) : super(key: key);
  final God god;

  @override
  State<ActionList> createState() => _ActionListState();
}

// floatingActionButton: FloatingActionButton(
//     onPressed: () => Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (BuildContext context) =>
//                 const AddReactionPage())),
//     backgroundColor: Colors.deepPurple,
//     child: const Icon(Icons.add, color: Colors.black)),
// floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

class _ActionListState extends State<ActionList> {
  List<Widget> list = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 3), (Timer t) => getAllActions());
  }

  List<Widget> getAllActions() {
    List<Widget> actionList = [];

    // actionList.add(TextButton(
    //     leading: ExcludeSemantics(child: CircleAvatar(child: Text('X'))),
    //     title: const Text('Issue'),
    //     trailing: Row(children: [
    //       const Text('Add Reactions'),
    //       IconButton(
    //           onPressed: () {},
    //           icon: const Icon(Icons.add, color: Colors.deepPurple)),
    //     ]),
    //     subtitle: const Text('Github')));

    for (int i = 0;
        i < widget.god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionCodebaseMergeRequestReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/code.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Codebase - Merge request')
            ])),
      ));
      // trailing: Row(children: [
      // const Text('Add Reactions'),
      // IconButton(
      // onPressed: () => Navigator.push(
      // context,
      // MaterialPageRoute(
      // builder: (BuildContext context) => AddReactionPage(
      // id: widget.god.globalContainer
      // .actionCodebaseMergeRequest[i].id))),
      // icon: const Icon(Icons.add, color: Colors.deepPurple)),
      // ]),
      // subtitle: const Text('Codebase')));

    }
    for (int i = 0;
        i < widget.god.globalContainer.actionCodebasePush.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionCodebasePushReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/code.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Codebase - Push')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionCodebaseTicketCreationReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/code.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Codebase - Ticket Creation')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionCodebaseTicketUpdateReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/code.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Codebase - Ticket Update')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubIssueComment.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubIssueCommentReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Issue Comment')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubIssue.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubIssueReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Issue')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubLabel.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubLabelReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Label')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubMilestone.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubMilestoneReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Milestone')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubPullRequest.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubPullRequestReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Pull Request')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGithubPush.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGithubPushReactionPage(
                            id: widget.god.globalContainer
                                .actionCodebaseMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/github.jpg'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Github - Push')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabComment.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGitlabCommentReactionPage(
                            id: widget
                                .god.globalContainer.actionGitlabComment[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gitlab.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Gitlab - Comment')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabIssue.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGitlabIssueReactionPage(
                            id: widget
                                .god.globalContainer.actionGitlabIssue[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gitlab.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Gitlab - Issue')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabPush.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGitlabPushReactionPage(
                            id: widget
                                .god.globalContainer.actionGitlabPush[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gitlab.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Gitlab - Push')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGitlabMergeRequestReactionPage(
                            id: widget.god.globalContainer
                                .actionGitlabMergeRequest[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gitlab.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Gitlab - Merge request')
            ])),
      ));
    }
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabWiki.length;
        i++) {
      actionList.add(Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: Colors.grey[200],
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12))),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ActionGitlabWikiReactionPage(
                            id: widget
                                .god.globalContainer.actionGitlabWiki[i].id,
                            god: widget.god))),
            child: Row(children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/gitlab.png'),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              const SizedBox(width: 20),
              const Text('Gitlab - Wiki')
            ])),
      ));
    }
    setState(() {
    });
    return actionList;
  }

  @override
  Widget build(BuildContext context) {
    setState(() => list = getAllActions());
    return Scaffold(
        appBar: AppBar(
            title: const Text('Action List'), automaticallyImplyLeading: false),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
                child: ListView(
                    // restorationId: 'ActionList',
                    padding: const EdgeInsets.all(8),
                    children: list))));
  }
}
