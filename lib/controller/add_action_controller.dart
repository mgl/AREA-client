import 'package:client/models/add_action_model.dart';

class AddActionController {
  static void GitlabWiki(String repoID) {
    AddActionModel().GitlabWikiActionCreate(repoID);
  }

  static void GitlabMergeRequest(String repoID) {
    AddActionModel().GitlabMergeRequestActionCreate(repoID);
  }

  static void GitlabIssues(String repoID) {
    AddActionModel().GitlabIssuesActionCreate(repoID);
  }

  static void GitlabComment(String repoID) {
    AddActionModel().GitlabCommentActionCreate(repoID);
  }

  static void GitlabPush(String repoID) {
    AddActionModel().GitlabPushActionCreate(repoID);
  }

  static void GithubIssueComment(String repoID, String owner) {
    AddActionModel().GithubCreateIssueCommentActionCreate(repoID, owner);
  }

  static void GithubLabel(String repoID, String owner) {
    AddActionModel().GithubCreateLabelActionCreate(repoID, owner);
  }

  static void GithubMilestone(String repoID, String owner) {
    AddActionModel().GithubCreateMilestoneActionCreate(repoID, owner);
  }

  static void GithubPullRequest(String repoID, String owner) {
    AddActionModel().GithubCreatePullRequestActionCreate(repoID, owner);
  }

  static void GithubPush(String repoID, String owner) {
    AddActionModel().GithubCreatePushActionCreate(repoID, owner);
  }

  static void GithubIssue(String repoID, String owner) {
    AddActionModel().GithubCreateIssuesActionCreate(repoID, owner);
  }

  static void CodebasePush() {
    AddActionModel().CodebasePushActionCreate();
  }

  static void CodebaseMergueRequest() {
    AddActionModel().CodebaseMergeRequestActionCreate();
  }

  static void CodebaseTicketCreation() {
    AddActionModel().CodebaseTicketCreationActionCreate();
  }

  static void CodebaseTicketUpdate() {
    AddActionModel().CodebaseTicketUpdateActionCreate();
  }
}
