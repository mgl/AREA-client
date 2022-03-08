import 'package:client/models/actions/action_github_issue.dart';
import 'package:client/models/actions/action_github_issue_comment.dart';
import 'package:client/models/globals.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:uuid/uuid.dart';
import 'package:client/models/actions/action_github_label.dart';
import 'package:client/models/actions/action_github_milestone.dart';
import 'package:client/models/actions/action_github_pull_request.dart';
import 'package:client/models/actions/action_gitlab_wiki.dart';
import 'package:client/models/actions/action_github_push.dart';

class AddActionModel {
  void githubCreateIssuesActionCreate(String repoID, String owner) async {
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
    
  }

  void githubCreateIssueCommentActionCreate(String repoID, String owner) async {
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
    await post(url, headers: header, body: body);
  }

  void githubCreateLabelActionCreate(String repoID, String owner) async {
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
    await post(url, headers: header, body: body);
  }

  void githubCreateMilestoneActionCreate(String repoID, String owner) async {
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
    await post(url, headers: header, body: body);
  }

  void githubCreatePullRequestActionCreate(String repoID, String owner) async {
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
    await post(url, headers: header, body: body);
  }

  void githubCreatePushActionCreate(String repoID, String owner) async {
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
    await post(url, headers: header, body: body);
  }

  void gitlabWikiActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/wiki_page_events');
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
    };
    ActionGitlabWiki action = ActionGitlabWiki();
    action.id = uuid;
    action.repoId = repoID;
    action.token = tmp;
    globalContainer.actionGitlabWiki.add(action);
    await post(url, headers: header, body: body);
  }

  void gitlabMergeRequestActionCreate(String repoID) async {
    final url =
        Uri.parse('$urlPrefix/services/gitlab/action/merge_requests_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void gitlabIssuesActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void gitlabCommentActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void gitlabPushActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void codebaseMergeRequestActionCreate() async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_merge_request');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void codebasePushActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/codebase_push');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void codebaseTicketCreationActionCreate() async {
    final url = Uri.parse(
        '$urlPrefix/services/codebase/action/codebase_ticket_creation');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void codebaseTicketUpdateActionCreate() async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_ticket_update');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }
}
