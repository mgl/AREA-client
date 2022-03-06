import 'package:http/http.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/service.dart';
import 'package:client/models/actions/action_gitlab_push.dart';
import 'package:client/models/actions/action_gitlab_push.dart';
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

class SetupModel {
  void getServices() async {
    final url = Uri.parse('$urlPrefix/service_list');
    final response = await get(url);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final serviceData = splitted.first.split('=');
      Service service =
          Service(serviceData.elementAt(0), serviceData.elementAt(1));
      globalContainer?.service.add(service);
      splitted.removeAt(0);
    }
  }

  void getActions() async {
    final url = Uri.parse('$urlPrefix/action_list');
    final response = await get(url);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "gitlab_merge_requests_events":
          {
            ActionGitlabPush action = ActionGitlabPush();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGitlabPush.add(action);
          }
          break;
        case "gitlab_wiki_page_events":
          {
            ActionGitlabWiki action = ActionGitlabWiki();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGitlabWiki.add(action);
          }
          break;
        case "gitlab_push_events":
          {
            ActionGitlabPush action = ActionGitlabPush();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGitlabPush.add(action);
          }
          break;
        case "github_push":
          {
            ActionGithubPush action = ActionGithubPush();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubPush.add(action);
          }
          break;
        case "github_pull_request":
          {
            ActionGithubPullRequest action = ActionGithubPullRequest();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubPullRequest.add(action);
          }
          break;
        case "github_milestone":
          {
            ActionGithubMilestone action = ActionGithubMilestone();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubMilestone.add(action);
          }
          break;
        case "github_label":
          {
            ActionGithubLabel action = ActionGithubLabel();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubLabel.add(action);
          }
          break;
        case "github_issues":
          {
            ActionGithubIssue action = ActionGithubIssue();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubIssue.add(action);
          }
          break;
        case "github_issue_comment":
          {
            ActionGithubIssueComment action = ActionGithubIssueComment();
            action.id = actionData.elementAt(0);
            action.id = actionData.elementAt(1);
            globalContainer?.actionGithubIssueComment.add(action);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReaction(String id) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"id": id};
    final response = await get(url, headers: header);
    final body = response.body;
  }
}
