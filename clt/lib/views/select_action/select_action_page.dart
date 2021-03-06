import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_codebase_push.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_codebase_ticket_creation.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_codebase_ticket_update.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_issue.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_issue_comment.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_label.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_milestone.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_pull_request.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_gitlab_comment.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_codebase_merge_request.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_gitlab_issue.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_gitlab_merge_request.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_gitlab_push.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_github_push.dart';
import 'package:clt/views/select_action/addActionButtons/button_action_gitlab_wiki.dart';

class SelectActionPage extends StatefulWidget {
  const SelectActionPage({Key? key, required this.god}) : super(key: key);
  final God god;
  @override
  State<SelectActionPage> createState() => _SelectActionPageState();
}

class _SelectActionPageState extends State<SelectActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Action selection'),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back))),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
                child: Column(children: [
              ButtonActionCodebaseMergeRequest(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionCodebasePush(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionCodebaseTicketCreation(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionCodebaseTicketUpdate(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubIssueComment(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubIssue(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubLabel(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubMilestone(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubPullRequest(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGithubPush(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGitlabPush(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGitlabComment(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGitlabIssue(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGitlabMergeRequest(god: widget.god),
              const SizedBox(height: 5),
              ButtonActionGitlabWiki(god: widget.god)
            ]))));
  }
}
