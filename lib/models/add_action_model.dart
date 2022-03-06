import 'package:client/models/actions/action_github_issue.dart';
import 'package:client/models/actions/action_github_issue_comment.dart';
import 'package:client/models/globals.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:uuid/uuid.dart';
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
import 'dart:core';

class AddActionModel {
  void GithubCreateIssuesActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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
    await post(url, headers: header, body: body);
  }

  void GithubCreateIssueCommentActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/issue_comment');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GithubCreateLabelActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/label');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GithubCreateMilestoneActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/milestone');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GithubCreatePullRequestActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/pull_request');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GithubCreatePushActionCreate(String repoID, String owner) async {
    final url = Uri.parse('$urlPrefix/services/github/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GitlabWikiActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/wiki_page_events');
    final header = {"Authorization": "Bearer " + globalToken};

    String tmp = "";
    for (int i = 0; i < globalContainer.service.length; i++) {
      if (globalContainer.service[i].name == "github") {
        tmp = globalContainer.service[i].token;
      }
    }
    var uuid = Uuid().v4();
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

  void GitlabMergeRequestActionCreate(String repoID) async {
    final url =
        Uri.parse('$urlPrefix/services/gitlab/action/merge_requests_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabIssuesActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabCommentActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoName": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabPushActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebaseMergeRequestActionCreate() async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_merge_request');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebasePushActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/codebase_push');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebaseTicketCreationActionCreate() async {
    final url = Uri.parse(
        '$urlPrefix/services/codebase/action/codebase_ticket_creation');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebaseTicketUpdateActionCreate() async {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_ticket_update');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }
}
