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
}
