import 'package:client/models/globals.dart';
import 'package:client/views/home/home.dart';
import 'package:http/http.dart';
import 'dart:core';
import 'package:uuid/uuid.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';



class AddReactionModel {
  void discordReaction(String actionId, String message, String server,
      String channel, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/discord/reaction/classic_reaction');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "discord") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "token": tmp,
      "message": message,
      "server": server,
      "channel": channel
    };

    ReactionDiscordMessage reaction = ReactionDiscordMessage();
    reaction.id = uuid;
    reaction.message = message;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionDiscordMessage
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

  void mailReaction(String actionId, String object, String content,
      String receiver, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/mail/reaction');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "google") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "object": object,
      "token": tmp,
      "content": content,
      "receiver": receiver
    };

    ReactionGoogleCalendarEvent reaction = ReactionGoogleCalendarEvent();
    reaction.id = uuid;
    reaction.content = content;
    reaction.receiver = receiver;
    reaction.object = object;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionGoogleCalendarEvent
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

  void twitterTweetReaction(String actionId, String message, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/twitter/reaction/tweet');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "twitter") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "token": tmp,
      "message": message,
    };

    ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
    reaction.id = uuid;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionTwitterPostTweet
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

  
  void twitterFollowReaction(String actionId, String user, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/twitter/reaction/follow');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "twitter") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "token": tmp,
      "user": user,
    };

    ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
    reaction.id = uuid;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

  void twitterRetweetReaction(String actionId, String tweetId, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/twitter/reaction/retweet');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "twitter") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "token": tmp,
      "tweetId": tweetId,
    };

    ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
    reaction.id = uuid;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionTwitterRetweet
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

  void twitterLikeReaction(String actionId, String tweetId, String globalToken, God god) {
    final url =
        Uri.parse('$urlPrefix/services/twitter/reaction/like');
    final header = {"Authorization": "Bearer " + globalToken};
    String tmp = "";
    for (int i = 0; i < god.globalContainer.service.length; i++) {
      if (god.globalContainer.service[i].name == "twitter") {
        tmp = god.globalContainer.service[i].token;
      }
    }
    var uuid = const Uuid().v4();
    final body = {
      "id": uuid,
      "actionId": actionId,
      "token": tmp,
      "tweetId": tweetId,
    };

    ReactionTwitterLike reaction = ReactionTwitterLike();
    reaction.id = uuid;
    reaction.token = tmp;
    god.globalContainer.actionGithubIssue;
    for (int i = 0;
        i < god.globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (god.globalContainer.actionCodebaseMergeRequest[i].id == actionId) {
        god.globalContainer.actionCodebaseMergeRequest[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionCodebasePush.length; i++) {
      if (god.globalContainer.actionCodebasePush[i].id == actionId) {
        god.globalContainer.actionCodebasePush[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketCreation[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketCreation[i]
            .reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (god.globalContainer.actionCodebaseTicketUpdate[i].id == actionId) {
        god.globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubIssueComment.length;
        i++) {
      if (god.globalContainer.actionGithubIssueComment[i].id == actionId) {
        god.globalContainer.actionGithubIssueComment[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubIssue.length; i++) {
      if (god.globalContainer.actionGithubIssue[i].id == actionId) {
        god.globalContainer.actionGithubIssue[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubLabel.length; i++) {
      if (god.globalContainer.actionGithubLabel[i].id == actionId) {
        god.globalContainer.actionGithubLabel[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubMilestone.length; i++) {
      if (god.globalContainer.actionGithubMilestone[i].id == actionId) {
        god.globalContainer.actionGithubMilestone[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGithubPullRequest.length;
        i++) {
      if (god.globalContainer.actionGithubPullRequest[i].id == actionId) {
        god.globalContainer.actionGithubPullRequest[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGithubPush.length; i++) {
      if (god.globalContainer.actionGithubPush[i].id == actionId) {
        god.globalContainer.actionGithubPush[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabComment.length; i++) {
      if (god.globalContainer.actionGitlabComment[i].id == actionId) {
        god.globalContainer.actionGitlabComment[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabIssue.length; i++) {
      if (god.globalContainer.actionGitlabIssue[i].id == actionId) {
        god.globalContainer.actionGitlabIssue[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabPush.length; i++) {
      if (god.globalContainer.actionGitlabPush[i].id == actionId) {
        god.globalContainer.actionGitlabPush[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0;
        i < god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (god.globalContainer.actionGitlabMergeRequest[i].id == actionId) {
        god.globalContainer.actionGitlabMergeRequest[i].reactionTwitterLike
            .add(reaction);
      }
    }
    for (int i = 0; i < god.globalContainer.actionGitlabWiki.length; i++) {
      if (god.globalContainer.actionGitlabWiki[i].id == actionId) {
        god.globalContainer.actionGitlabWiki[i].reactionTwitterLike
            .add(reaction);
      }
    }
    post(url, headers: header, body: body);
  }

}
