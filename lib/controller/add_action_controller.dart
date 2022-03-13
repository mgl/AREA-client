import 'package:client/models/add_action_model.dart';
import 'package:client/views/home/home.dart';

class AddActionController {
  static void gitlabWiki(
          String repoID, God god, String globalToken) =>
      AddActionModel()
          .gitlabWikiActionCreate(repoID, globalToken, god);

  static void gitlabMergeRequest(
          String repoID, God god, String globalToken) =>
      AddActionModel()
          .gitlabMergeRequestActionCreate(repoID, globalToken, god);

  static void gitlabIssues(
          String repoID, God god, String globalToken) =>
      AddActionModel()
          .gitlabIssuesActionCreate(repoID, globalToken, god);

  static void gitlabComment(
          String repoID, God god, String globalToken) =>
      AddActionModel()
          .gitlabCommentActionCreate(repoID, globalToken, god);

  static void gitlabPush(
          String repoID, God god, String globalToken) =>
      AddActionModel()
          .gitlabPushActionCreate(repoID, globalToken, god);

  static void githubIssueComment(String repoID, String owner,
          String globalToken, God god) =>
      AddActionModel().githubCreateIssueCommentActionCreate(
          repoID, owner, globalToken, god);

  static void githubLabel(String repoID, String owner, String globalToken,
          God god) =>
      AddActionModel().githubCreateLabelActionCreate(
          repoID, owner, globalToken, god);

  static void githubMilestone(String repoID, String owner, String globalToken,
          God god) =>
      AddActionModel().githubCreateMilestoneActionCreate(
          repoID, owner, globalToken, god);

  static void githubPullRequest(String repoID, String owner, String globalToken,
          God god) =>
      AddActionModel().githubCreatePullRequestActionCreate(
          repoID, owner, globalToken, god);

  static void githubPush(String repoID, String owner, String globalToken,
          God god) =>
      AddActionModel().githubCreatePushActionCreate(
          repoID, owner, globalToken, god);

  static void githubIssue(String repoID, String owner, String globalToken,
          God god) =>
      AddActionModel().githubCreateIssuesActionCreate(
          repoID, owner, globalToken, god);

  static void codebasePush(
          String globalToken, God god) =>
      AddActionModel().codebasePushActionCreate(globalToken, god);

  static void codebaseMergueRequest(
          String globalToken, God god) =>
      AddActionModel()
          .codebaseMergeRequestActionCreate(globalToken, god);

  static void codebaseTicketCreation(
          String globalToken, God god) =>
      AddActionModel()
          .codebaseTicketCreationActionCreate(globalToken, god);

  static void codebaseTicketUpdate(
          String globalToken, God god) =>
      AddActionModel()
          .codebaseTicketUpdateActionCreate(globalToken, god);
}
