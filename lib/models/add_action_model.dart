import 'package:client/models/action_container.dart';
import 'package:client/models/actions/action_github_issue.dart';
import 'package:client/models/actions/action_github_issue_comment.dart';
import 'package:client/models/actions/action_gitlab_comment.dart';
import 'package:client/models/actions/action_gitlab_issue.dart';
import 'package:client/models/actions/action_gitlab_merge_request.dart';
import 'package:client/models/actions/action_gitlab_push.dart';
import 'package:client/models/globals.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:uuid/uuid.dart';
import 'package:client/models/actions/action_github_label.dart';
import 'package:client/models/actions/action_github_milestone.dart';
import 'package:client/models/actions/action_github_pull_request.dart';
import 'package:client/models/actions/action_gitlab_wiki.dart';
import 'package:client/models/actions/action_github_push.dart';
import 'package:client/models/actions/action_codebase_ticket_creation.dart';
import 'package:client/models/actions/action_codebase_ticket_update.dart';
import 'package:client/models/actions/action_codebase_merge_request.dart';
import 'package:client/models/actions/action_codebase_push.dart';
import 'package:flutter/material.dart';

class AddActionModel {
  void githubCreateIssuesActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubIssue action = ActionGithubIssue();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubIssue.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void githubCreateIssueCommentActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/issue_comment');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubIssueComment action = ActionGithubIssueComment();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubIssueComment.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void githubCreateLabelActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/label');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubLabel action = ActionGithubLabel();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubLabel.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void githubCreateMilestoneActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/milestone');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubMilestone action = ActionGithubMilestone();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubMilestone.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void githubCreatePullRequestActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/pull_request');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubPullRequest action = ActionGithubPullRequest();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubPullRequest.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void githubCreatePushActionCreate(String repoID, String owner, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/github/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
      "userName": owner
    };
    ActionGithubPush action = ActionGithubPush();
    action.id = uuid;
    action.owner = owner;
    action.repo = repoID;
    action.token = tmp;
    globalContainer.actionGithubPush.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void gitlabWikiActionCreate(String repoID, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/wiki_page_events');
    final header = {"Authorization": "Bearer " + globalToken};

    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "gitlab") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
    };
    ActionGitlabWiki action = ActionGitlabWiki();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabWiki.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void gitlabMergeRequestActionCreate(String repoID, String globalToken, ActionContainer globalContainer) async {
    final url =
        Uri.parse('$urlPrefix/services/gitlab/action/merge_requests_events');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "gitlab") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
    };
    ActionGitlabMergeRequest action = ActionGitlabMergeRequest();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabMergeRequest.add(action);

    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void gitlabIssuesActionCreate(String repoID, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "gitlab") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
    };
    ActionGitlabIssue action = ActionGitlabIssue();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabIssue.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void gitlabCommentActionCreate(String repoID, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "gitlab") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
    };
    ActionGitlabComment action = ActionGitlabComment();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabComment.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void gitlabPushActionCreate(String repoID, String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "gitlab") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "token": tmp,
      "repoName": repoID,
    };
    ActionGitlabPush action = ActionGitlabPush();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabPush.add(action);
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void codebaseMergeRequestActionCreate(String globalToken, ActionContainer globalContainer) async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_merge_request');
    final header = {"Authorization": "Bearer " + globalToken};

    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebaseMergeRequest action = ActionCodebaseMergeRequest();
    action.id = uuid;
    action.token = tmp;
    globalContainer.actionCodebaseMergeRequest.add(action);
    var response = await post(url, headers: header);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void codebasePushActionCreate(String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/codebase_push');
    final header = {"Authorization": "Bearer " + globalToken};

    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebasePush action = ActionCodebasePush();
    action.id = uuid;
    action.token = tmp;
    globalContainer.actionCodebasePush.add(action);
    var response = await post(url, headers: header);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void codebaseTicketCreationActionCreate(String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse(
        '$urlPrefix/services/codebase/action/codebase_ticket_creation');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebaseTicketCreation action = ActionCodebaseTicketCreation();
    action.id = uuid;
    action.token = tmp;
    globalContainer.actionCodebaseTicketCreation.add(action);
    var response = await post(url, headers: header);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }

  void codebaseTicketUpdateActionCreate(String globalToken, ActionContainer globalContainer) async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_ticket_update');
    final header = {"Authorization": "Bearer " + globalToken};

    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "codebase") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();

    ActionCodebaseTicketUpdate action = ActionCodebaseTicketUpdate();
    action.id = uuid;
    action.token = tmp;
    globalContainer.actionCodebaseTicketUpdate.add(action);

    var response = await post(url, headers: header);
    final SnackBar snackBar =
        SnackBar(content: Text(response.statusCode.toString()));
    await snackbarKey.currentState?.showSnackBar(snackBar).closed;
  }
}
