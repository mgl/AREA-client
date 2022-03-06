import 'package:flutter/material.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_push.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_ticket_creation.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_ticket_update.dart';
import 'package:client/views/home/addActionButtons/button_action_github_issue.dart';
import 'package:client/views/home/addActionButtons/button_action_github_issue_comment.dart';
import 'package:client/views/home/addActionButtons/button_action_github_label.dart';
import 'package:client/views/home/addActionButtons/button_action_github_milestone.dart';
import 'package:client/views/home/addActionButtons/button_action_github_pull_request.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_comment.dart';
import 'package:client/views/home/addActionButtons/button_action_codebase_merge_request.dart';

import 'package:client/views/home/addActionButtons/button_action_gitlab_issue.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_merge_request.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_push.dart';
import 'package:client/views/home/addActionButtons/button_action_github_push.dart';
import 'package:client/views/home/addActionButtons/button_action_gitlab_wiki.dart';

class SelectActionPage extends StatefulWidget {
  const SelectActionPage({Key? key}) : super(key: key);

  @override
  State<SelectActionPage> createState() => _SelectActionPageState();
}

class _SelectActionPageState extends State<SelectActionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Action selection')),
        body: Container(
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
                child: Column(children: const [
              ButtonActionCodebaseMergeRequest(),
              SizedBox(height: 5),
              ButtonActionCodebasePush(),
              SizedBox(height: 5),
              ButtonActionCodebaseTicketCreation(),
              SizedBox(height: 5),
              ButtonActionCodebaseTicketUpdate(),
              SizedBox(height: 5),
              ButtonActionGithubIssueComment(),
              SizedBox(height: 5),
              ButtonActionGithubIssue(),
              SizedBox(height: 5),
              ButtonActionGithubLabel(),
              SizedBox(height: 5),
              ButtonActionGithubMilestone(),
              SizedBox(height: 5),
              ButtonActionGithubPullRequest(),
              SizedBox(height: 5),
              ButtonActionGithubPush(),
              SizedBox(height: 5),
              ButtonActionGitlabPush(),
              SizedBox(height: 5),
              ButtonActionGitlabComment(),
              SizedBox(height: 5),
              ButtonActionGitlabIssue(),
              SizedBox(height: 5),
              ButtonActionGitlabMergeRequest(),
              SizedBox(height: 5),
              ButtonActionGitlabWiki()
            ]))));
  }
}
