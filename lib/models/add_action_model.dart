import 'package:client/models/globals.dart';
import 'package:http/http.dart';

import 'dart:core';

class AddActionModel {
  void GithubCreateIssuesActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/github/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GithubCreateIssueCommentActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/github/action/issue_comment');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GithubCreateLabelActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/github/action/label');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GithubCreateMilestoneActionCreate() async {
    final url = Uri.parse('$urlPrefix/action/milestone');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GithubCreatePullRequestActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/github/action/pull_request');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GithubCreatePushActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/github/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void GitlabWikiActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/wiki_page_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoId": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabMergeRequestActionCreate(String repoID) async {
    final url =
        Uri.parse('$urlPrefix/services/gitlab/action/merge_requests_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoId": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabIssuesActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoId": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabCommentActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoId": repoID};
    await post(url, headers: header, body: body);
  }

  void GitlabPushActionCreate(String repoID) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/action/push_events');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"repoId": repoID};
    await post(url, headers: header, body: body);
  }



  void CodebaseMergeRequestActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebasePushActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebaseTicketCreationActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void CodebaseTicketUpdateActionCreate() async {
    final url = Uri.parse('$urlPrefix/services/codebase/action/issues');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }
}
