import 'package:clt/models/globals.dart';
import 'package:clt/models/service.dart';
import 'package:http/http.dart';
import 'package:clt/views/home/home.dart';
import 'package:uuid/uuid.dart';

class SubscribeModel {
  void subscribeGithub(String value, God god) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "github", token: value));
  }

  void unsubscribeGithub(God god) async {
    final url = Uri.parse('$urlPrefix/services/github/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToGithub = false;
    god.globalContainer.actionGithubIssue = [];
    god.globalContainer.actionGithubIssueComment = [];
    god.globalContainer.actionGithubLabel = [];
    god.globalContainer.actionGithubMilestone = [];
    god.globalContainer.actionGithubPullRequest = [];
    god.globalContainer.actionGithubPush = [];
  }

  void subscribeCodebase(String apiKey, String userName, God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "token": apiKey,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "Codebase", token: apiKey));
  }

  void unsubscribeCodebase(God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToCodebase = false;
    god.globalContainer.actionCodebaseMergeRequest = [];
    god.globalContainer.actionCodebasePush = [];
    god.globalContainer.actionCodebaseTicketCreation = [];
    god.globalContainer.actionCodebaseTicketUpdate = [];
  }

  void subscribeGitlab(String value, God god) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "gitlab", token: value));
  }

  void unsubscribeGitlab(God god) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToGitlab = false;
    god.globalContainer.actionGitlabWiki = [];
    god.globalContainer.actionGitlabPush = [];
    god.globalContainer.actionGitlabMergeRequest = [];
    god.globalContainer.actionGitlabComment = [];
    god.globalContainer.actionGitlabIssue = [];
  }

  void subscribeDiscord(God god) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    post(url, headers: header, body: {'token': const Uuid().v4()});
    god.globalContainer.service
        .add(Service(name: "discord", token: const Uuid().v4()));
  }

  void unsubscribeDiscord(God god) async {
    final url = Uri.parse('$urlPrefix/services/discord/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToDiscord = false;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      god.globalContainer.actionCodebaseMergeRequest[i].reactionDiscordMessage =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      god.globalContainer.actionCodebasePush[i].reactionDiscordMessage = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      god.globalContainer.actionCodebaseTicketCreation[i]
          .reactionDiscordMessage = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      god.globalContainer.actionCodebaseTicketUpdate[i].reactionDiscordMessage =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      god.globalContainer.actionGithubIssue[i].reactionDiscordMessage = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      god.globalContainer.actionGithubIssueComment[i].reactionDiscordMessage =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      god.globalContainer.actionGithubLabel[i].reactionDiscordMessage = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      god.globalContainer.actionGithubMilestone[i].reactionDiscordMessage = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      god.globalContainer.actionGithubPullRequest[i].reactionDiscordMessage =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      god.globalContainer.actionGithubPush[i].reactionDiscordMessage = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      god.globalContainer.actionGitlabComment[i].reactionDiscordMessage = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      god.globalContainer.actionGitlabIssue[i].reactionDiscordMessage = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      god.globalContainer.actionGitlabMergeRequest[i].reactionDiscordMessage =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      god.globalContainer.actionGitlabPush[i].reactionDiscordMessage = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      god.globalContainer.actionGitlabWiki[i].reactionDiscordMessage = [];
    }
  }

  Future subscribeMail(String userName, String appPassword, God god) async {
    final url = Uri.parse('$urlPrefix/services/mail/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "mail", token: const Uuid().v4()));
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      god.globalContainer.actionCodebaseMergeRequest[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      god.globalContainer.actionCodebasePush[i].reactionMail = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      god.globalContainer.actionCodebaseTicketCreation[i].reactionMail = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      god.globalContainer.actionCodebaseTicketUpdate[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      god.globalContainer.actionGithubIssue[i].reactionMail = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      god.globalContainer.actionGithubIssueComment[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      god.globalContainer.actionGithubLabel[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      god.globalContainer.actionGithubMilestone[i].reactionMail = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      god.globalContainer.actionGithubPullRequest[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      god.globalContainer.actionGithubPush[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      god.globalContainer.actionGitlabComment[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      god.globalContainer.actionGitlabIssue[i].reactionMail = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      god.globalContainer.actionGitlabMergeRequest[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      god.globalContainer.actionGitlabPush[i].reactionMail = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      god.globalContainer.actionGitlabWiki[i].reactionMail = [];
    }
  }

  Future unsubscribeMail(God god) async {
    final url = Uri.parse('$urlPrefix/services/mail/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToMail = false;
  }

  void subscribeTwitter(String accessToken, String accessPassword,
      String appKeyToken, String appPassword, God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "accessToken": accessToken,
      "accessPassword": accessPassword,
      "appKeyToken": appKeyToken,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "twitter", token: accessToken));
  }

  void unsubscribeTwitter(God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    delete(url, headers: header);
    god.connectedToTwitter = false;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      god.globalContainer.actionCodebaseMergeRequest[i]
          .reactionTwitterFollowUser = [];
      god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterRetweet =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      god.globalContainer.actionCodebasePush[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionCodebasePush[i].reactionTwitterLike = [];
      god.globalContainer.actionCodebasePush[i].reactionTwitterLike = [];
      god.globalContainer.actionCodebasePush[i].reactionTwitterRetweet = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      god.globalContainer.actionCodebaseTicketCreation[i]
          .reactionTwitterFollowUser = [];
      god.globalContainer.actionCodebaseTicketCreation[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseTicketCreation[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseTicketCreation[i]
          .reactionTwitterRetweet = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      god.globalContainer.actionCodebaseTicketUpdate[i]
          .reactionTwitterFollowUser = [];
      god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterLike =
          [];
      god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterRetweet =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      god.globalContainer.actionGithubIssue[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGithubIssue[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubIssue[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubIssue[i].reactionTwitterRetweet = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      god.globalContainer.actionGithubIssueComment[i]
          .reactionTwitterFollowUser = [];
      god.globalContainer.actionGithubIssueComment[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubIssueComment[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubIssueComment[i].reactionTwitterRetweet =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      god.globalContainer.actionGithubLabel[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGithubLabel[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubLabel[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubLabel[i].reactionTwitterRetweet = [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      god.globalContainer.actionGithubMilestone[i].reactionTwitterFollowUser =
          [];
      god.globalContainer.actionGithubMilestone[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubMilestone[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubMilestone[i].reactionTwitterRetweet = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      god.globalContainer.actionGithubPullRequest[i].reactionTwitterFollowUser =
          [];
      god.globalContainer.actionGithubPullRequest[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubPullRequest[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubPullRequest[i].reactionTwitterRetweet =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      god.globalContainer.actionGithubPush[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGithubPush[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubPush[i].reactionTwitterLike = [];
      god.globalContainer.actionGithubPush[i].reactionTwitterRetweet = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      god.globalContainer.actionGitlabComment[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGitlabComment[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabComment[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabComment[i].reactionTwitterRetweet = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      god.globalContainer.actionGitlabIssue[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGitlabIssue[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabIssue[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabIssue[i].reactionTwitterRetweet = [];
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      god.globalContainer.actionGitlabMergeRequest[i]
          .reactionTwitterFollowUser = [];
      god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterRetweet =
          [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      god.globalContainer.actionGitlabPush[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGitlabPush[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabPush[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabPush[i].reactionTwitterRetweet = [];
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      god.globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser = [];
      god.globalContainer.actionGitlabWiki[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabWiki[i].reactionTwitterLike = [];
      god.globalContainer.actionGitlabWiki[i].reactionTwitterRetweet = [];
    }
  }
}
