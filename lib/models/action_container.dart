import 'package:client/models/actions/action_codebase_merge_request.dart';
import 'package:client/models/actions/action_codebase_push.dart';
import 'package:client/models/actions/action_codebase_ticket_creation.dart';
import 'package:client/models/actions/action_codebase_ticket_update.dart';
import 'package:client/models/actions/action_github_issue.dart';
import 'package:client/models/actions/action_github_issue_comment.dart';
import 'package:client/models/actions/action_github_label.dart';
import 'package:client/models/actions/action_github_milestone.dart';
import 'package:client/models/actions/action_github_pull_request.dart';
import 'package:client/models/actions/action_gitlab_comment.dart';
import 'package:client/models/actions/action_gitlab_issue.dart';
import 'package:client/models/actions/action_gitlab_merge_request.dart';
import 'package:client/models/actions/action_gitlab_push.dart';
import 'package:client/models/actions/action_gitlab_wiki.dart';
import 'package:client/models/service.dart';
import 'package:client/models/actions/action_github_push.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class ActionContainer {
  List<Service> service = [];
  List<ActionCodebaseMergeRequest> actionCodebaseMergeRequest = [];
  List<ActionCodebasePush> actionCodebasePush = [];
  List<ActionCodebaseTicketCreation> actionCodebaseTicketCreation = [];
  List<ActionCodebaseTicketUpdate> actionCodebaseTicketUpdate = [];
  List<ActionGithubIssueComment> actionGithubIssueComment = [];
  List<ActionGithubIssue> actionGithubIssue = [];
  List<ActionGithubLabel> actionGithubLabel = [];
  List<ActionGithubMilestone> actionGithubMilestone = [];
  List<ActionGithubPullRequest> actionGithubPullRequest = [];
  List<ActionGithubPush> actionGithubPush = [];
  List<ActionGitlabComment> actionGitlabComment = [];
  List<ActionGitlabIssue> actionGitlabIssue = [];
  List<ActionGitlabPush> actionGitlabPush = [];
  List<ActionGitlabMergeRequest> actionGitlabMergeRequest = [];
  List<ActionGitlabWiki> actionGitlabWiki = [];
}
