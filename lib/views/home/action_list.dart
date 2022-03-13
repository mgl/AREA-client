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
import 'package:client/views/reaction/add_reaction_page.dart';
import 'package:flutter/material.dart';
import 'package:client/views/reaction/action_gitlab_wiki_reaction_page.dart';
import 'package:client/models/action_container.dart';

class ActionList extends StatefulWidget {
  ActionList({Key? key, required this.globalContainer}) : super(key: key);
  ActionContainer globalContainer;

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
  List<ListTile> list = [];

  List<ListTile> getAllActions() {
    List<ListTile> actionList = [];
    for (int i = 0;
        i < widget.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionCodebaseMergeRequestReactionPage(
                          id: widget.globalContainer
                              .actionCodebaseMergeRequest[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Merge request'),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionCodebaseMergeRequest[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0; i < widget.globalContainer.actionCodebasePush.length; i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionCodebasePushReactionPage(
                          id: widget.globalContainer.actionCodebasePush[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionCodebasePush[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0;
        i < widget.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionCodebaseTicketCreationReactionPage(
                          id: widget.globalContainer
                              .actionCodebaseTicketCreation[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionCodebaseTicketCreation[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          title: const Text('Ticket creation'),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0;
        i < widget.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionCodebaseTicketUpdateReactionPage(
                          id: widget.globalContainer
                              .actionCodebaseTicketUpdate[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Ticket update'),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionCodebaseTicketUpdate[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          subtitle: const Text('Codebase')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubIssueComment.length; i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubIssueCommentReactionPage(
                          id: widget.globalContainer.actionGithubIssueComment[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue comment'),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionGithubIssueComment[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubIssue.length; i++) {
      list.add(ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubIssueReactionPage(
                          id: widget.globalContainer.actionGithubIssue[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue'),
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGithubIssue[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubLabel.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGithubLabel[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubLabelReactionPage(
                          id: widget.globalContainer.actionGithubLabel[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Label'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubMilestone.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGithubMilestone[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubMilestoneReactionPage(
                          id: widget.globalContainer.actionGithubMilestone[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Milestone'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubPullRequest.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionGithubPullRequest[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubPullRequestReactionPage(
                          id: widget.globalContainer.actionGithubPullRequest[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Pull request'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGithubPush.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGithubPush[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGithubPushReactionPage(
                          id: widget.globalContainer.actionGithubPush[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Github')));
    }
    for (int i = 0; i < widget.globalContainer.actionGitlabComment.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGitlabComment[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGitlabCommentReactionPage(
                          id: widget.globalContainer.actionGitlabComment[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Comment'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < widget.globalContainer.actionGitlabIssue.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGitlabIssue[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGitlabIssueReactionPage(
                          id: widget.globalContainer.actionGitlabIssue[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Issue'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < widget.globalContainer.actionGitlabPush.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGitlabPush[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGitlabPushReactionPage(
                          id: widget.globalContainer.actionGitlabPush[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < widget.globalContainer.actionGitlabMergeRequest.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer
                                .actionGitlabMergeRequest[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGitlabMergeRequestReactionPage(
                          id: widget.globalContainer.actionGitlabMergeRequest[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Merge request'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < widget.globalContainer.actionGitlabWiki.length; i++) {
      list.add(ListTile(
          trailing: Row(children: [
            const Text('Add Reactions'),
            IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AddReactionPage(
                            id: widget.globalContainer.actionGitlabWiki[i].id))),
                icon: const Icon(Icons.add, color: Colors.deepPurple)),
          ]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ActionGitlabWikiReactionPage(
                          id: widget.globalContainer.actionGitlabWiki[i].id))),
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Wiki'),
          subtitle: const Text('Gitlab')));
    }
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
                    restorationId: 'ActionList',
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    children: list))));
  }
}
