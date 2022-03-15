import 'package:client/models/add_action_model.dart';
import 'package:client/views/home/home.dart';

class AddActionController {
  static void gitlabWiki(String repoID, God god) =>
      AddActionModel().gitlabWikiActionCreate(repoID, god);

  static void gitlabMergeRequest(String repoID, God god) =>
      AddActionModel().gitlabMergeRequestActionCreate(repoID, god);

  static void gitlabIssues(String repoID, God god) =>
      AddActionModel().gitlabIssuesActionCreate(repoID, god);

  static void gitlabComment(String repoID, God god) =>
      AddActionModel().gitlabCommentActionCreate(repoID, god);

  static void gitlabPush(String repoID, God god) =>
      AddActionModel().gitlabPushActionCreate(repoID, god);

  static void githubIssueComment(String repoID, String owner, God god) =>
      AddActionModel().githubCreateIssueCommentActionCreate(repoID, owner, god);

  static void githubLabel(
          String repoID, String owner, God god) =>
      AddActionModel().githubCreateLabelActionCreate(repoID, owner, god);

  static void githubMilestone(
          String repoID, String owner, God god) =>
      AddActionModel().githubCreateMilestoneActionCreate(repoID, owner, god);

  static void githubPullRequest(
          String repoID, String owner, God god) =>
      AddActionModel().githubCreatePullRequestActionCreate(repoID, owner, god);

  static void githubPush(
          String repoID, String owner, God god) =>
      AddActionModel().githubCreatePushActionCreate(repoID, owner, god);

  static void githubIssue(
          String repoID, String owner, God god) =>
      AddActionModel().githubCreateIssuesActionCreate(repoID, owner, god);

  static void codebasePush(God god) =>
      AddActionModel().codebasePushActionCreate(god);

  static void codebaseMergueRequest(God god) =>
      AddActionModel().codebaseMergeRequestActionCreate(god);

  static void codebaseTicketCreation(God god) =>
      AddActionModel().codebaseTicketCreationActionCreate(god);

  static void codebaseTicketUpdate(God god) =>
      AddActionModel().codebaseTicketUpdateActionCreate(god);
}
