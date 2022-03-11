import 'package:client/models/actions/action_gitlab_push.dart';
import 'package:client/models/globals.dart';
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
import 'package:flutter/material.dart';
import 'package:client/views/reaction/action_gitlab_wiki_reaction_page.dart';

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
              return ActionCodebaseMergeRequestReactionPage(
                  id: globalContainer.actionCodebaseMergeRequest[i].id);
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
              return ActionCodebasePushReactionPage(
                  id: globalContainer.actionCodebasePush[i].id);
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
              return ActionCodebaseTicketCreationReactionPage(
                  id: globalContainer.actionCodebaseTicketCreation[i].id);
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
              return ActionCodebaseTicketUpdateReactionPage(
                  id: globalContainer.actionCodebaseTicketUpdate[i].id);
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
              return ActionGithubIssueCommentReactionPage(
                  id: globalContainer.actionGithubIssueComment[i].id);
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
              return ActionGithubIssueReactionPage(
                  id: globalContainer.actionGithubIssue[i].id);
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
              return ActionGithubLabelReactionPage(
                  id: globalContainer.actionGithubLabel[i].id);
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
              return ActionGithubMilestoneReactionPage(
                  id: globalContainer.actionGithubMilestone[i].id);
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
              return ActionGithubPullRequestReactionPage(
                  id: globalContainer.actionGithubPullRequest[i].id);
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
              return ActionGithubPushReactionPage(
                  id: globalContainer.actionGithubPush[i].id);
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
              return ActionGitlabCommentReactionPage(
                  id: globalContainer.actionGitlabComment[i].id);
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
              return ActionGitlabIssueReactionPage(
                  id: globalContainer.actionGitlabIssue[i].id);
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
              return ActionGitlabPushReactionPage(
                  id: globalContainer.actionGitlabPush[i].id);
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Push'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < globalContainer.actionGitlabMergeRequest.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ActionGitlabMergeRequestReactionPage(
                  id: globalContainer.actionGitlabMergeRequest[i].id);
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Merge request'),
          subtitle: const Text('Gitlab')));
    }
    for (int i = 0; i < globalContainer.actionGitlabWiki.length; i++) {
      list.add(ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return ActionGitlabWikiReactionPage(
                  id: globalContainer.actionGitlabWiki[i].id);
            }));
          },
          leading: ExcludeSemantics(child: CircleAvatar(child: Text('$i'))),
          title: const Text('Wiki'),
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
