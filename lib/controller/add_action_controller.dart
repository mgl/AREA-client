import 'package:client/models/add_action_model.dart';

class AddActionController {
  static void gitlabWiki(String repoID) =>
      AddActionModel().gitlabWikiActionCreate(repoID);

  static void gitlabMergeRequest(String repoID) =>
      AddActionModel().gitlabMergeRequestActionCreate(repoID);

  static void gitlabIssues(String repoID) =>
      AddActionModel().gitlabIssuesActionCreate(repoID);

  static void gitlabComment(String repoID) =>
      AddActionModel().gitlabCommentActionCreate(repoID);

  static void gitlabPush(String repoID) =>
      AddActionModel().gitlabPushActionCreate(repoID);

  static void githubIssueComment(String repoID, String owner) =>
      AddActionModel().githubCreateIssueCommentActionCreate(repoID, owner);

  static void githubLabel(String repoID, String owner) =>
      AddActionModel().githubCreateLabelActionCreate(repoID, owner);

  static void githubMilestone(String repoID, String owner) =>
      AddActionModel().githubCreateMilestoneActionCreate(repoID, owner);

  static void githubPullRequest(String repoID, String owner) =>
      AddActionModel().githubCreatePullRequestActionCreate(repoID, owner);

  static void githubPush(String repoID, String owner) =>
      AddActionModel().githubCreatePushActionCreate(repoID, owner);

  static void githubIssue(String repoID, String owner) =>
      AddActionModel().githubCreateIssuesActionCreate(repoID, owner);

  static void codebasePush() => AddActionModel().codebasePushActionCreate();

  static void codebaseMergueRequest() =>
      AddActionModel().codebaseMergeRequestActionCreate();

  static void codebaseTicketCreation() =>
      AddActionModel().codebaseTicketCreationActionCreate();

  static void codebaseTicketUpdate() =>
      AddActionModel().codebaseTicketUpdateActionCreate();
}
