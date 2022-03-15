import 'package:clt/models/actions/action_github_issue.dart';
import 'package:clt/models/actions/action_github_issue_comment.dart';
import 'package:clt/models/actions/action_gitlab_comment.dart';
import 'package:clt/models/actions/action_gitlab_issue.dart';
import 'package:clt/models/actions/action_gitlab_merge_request.dart';
import 'package:clt/models/actions/action_gitlab_push.dart';
import 'package:clt/models/globals.dart';
import 'package:clt/views/home/home.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:uuid/uuid.dart';
import 'package:clt/models/actions/action_github_label.dart';
import 'package:clt/models/actions/action_github_milestone.dart';
import 'package:clt/models/actions/action_github_pull_request.dart';
import 'package:clt/models/actions/action_gitlab_wiki.dart';
import 'package:clt/models/actions/action_github_push.dart';
import 'package:clt/models/actions/action_codebase_ticket_creation.dart';
import 'package:clt/models/actions/action_codebase_ticket_update.dart';
import 'package:clt/models/actions/action_codebase_merge_request.dart';
import 'package:clt/models/actions/action_codebase_push.dart';

class AddActionModel {
  void githubCreateIssuesActionCreate(String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/issues');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGithubIssue.add(action);
    post(url, headers: header, body: body);
  }

  void githubCreateIssueCommentActionCreate(
      String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/issue_comment');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGithubIssueComment.add(action);
    post(url, headers: header, body: body);
  }

  void githubCreateLabelActionCreate(String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/label');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    final uuid = const Uuid().v4();
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
    god.globalContainer.actionGithubLabel.add(action);
    post(url, headers: header, body: body);
  }

  void githubCreateMilestoneActionCreate(String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/milestone');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGithubMilestone.add(action);
    post(url, headers: header, body: body);
  }

  void githubCreatePullRequestActionCreate(
      String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/pull_request');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGithubPullRequest.add(action);
    post(url, headers: header, body: body);
  }

  void githubCreatePushActionCreate(String repoID, String owner, God god) {
    final url = Uri.parse('$urlPrefix/services/github/action/push');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "github") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGithubPush.add(action);
    post(url, headers: header, body: body);
  }

  void gitlabWikiActionCreate(String repoID, God god) {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/wiki_page_events');
    final header = {"Authorization": "Bearer " + god.globalToken};

    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "gitlab") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGitlabWiki.add(action);
    post(url, headers: header, body: body);
  }

  void gitlabMergeRequestActionCreate(String repoID, God god) {
    final url =
        Uri.parse('$urlPrefix/services/gitlab/action/merge_requests_events');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "gitlab") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGitlabMergeRequest.add(action);

    post(url, headers: header, body: body);
  }

  void gitlabIssuesActionCreate(String repoID, God god) {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/issue');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "gitlab") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGitlabIssue.add(action);
    post(url, headers: header, body: body);
  }

  void gitlabCommentActionCreate(String repoID, God god) {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "gitlab") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGitlabComment.add(action);
    post(url, headers: header, body: body);
  }

  void gitlabPushActionCreate(String repoID, God god) {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "gitlab") {
        tmp = god.globalContainer.service[i].token;
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
    god.globalContainer.actionGitlabPush.add(action);
    post(url, headers: header, body: body);
  }

  void codebaseMergeRequestActionCreate(God god) {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_merge_request');
    final header = {"Authorization": "Bearer " + god.globalToken};

    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "codebase") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebaseMergeRequest action = ActionCodebaseMergeRequest();
    action.id = uuid;
    action.token = tmp;
    god.globalContainer.actionCodebaseMergeRequest.add(action);
    post(url, headers: header);
  }

  void codebasePushActionCreate(God god) {
    final url = Uri.parse('$urlPrefix/services/codebase/action/codebase_push');
    final header = {"Authorization": "Bearer " + god.globalToken};

    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "codebase") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebasePush action = ActionCodebasePush();
    action.id = uuid;
    action.token = tmp;
    god.globalContainer.actionCodebasePush.add(action);
    post(url, headers: header);
  }

  void codebaseTicketCreationActionCreate(God god) {
    final url = Uri.parse(
        '$urlPrefix/services/codebase/action/codebase_ticket_creation');
    final header = {"Authorization": "Bearer " + god.globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "codebase") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    ActionCodebaseTicketCreation action = ActionCodebaseTicketCreation();
    action.id = uuid;
    action.token = tmp;
    god.globalContainer.actionCodebaseTicketCreation.add(action);
    post(url, headers: header);
  }

  void codebaseTicketUpdateActionCreate(God god) {
    final url =
        Uri.parse('$urlPrefix/services/codebase/action/codebase_ticket_update');
    final header = {"Authorization": "Bearer " + god.globalToken};

    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "codebase") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();

    ActionCodebaseTicketUpdate action = ActionCodebaseTicketUpdate();
    action.id = uuid;
    action.token = tmp;
    god.globalContainer.actionCodebaseTicketUpdate.add(action);

    post(url, headers: header);
  }
}
