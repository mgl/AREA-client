import 'package:http/http.dart';
import 'package:clt/models/globals.dart';
import 'package:clt/models/service.dart';
import 'package:clt/models/actions/action_gitlab_push.dart';
import 'package:clt/models/actions/action_codebase_merge_request.dart';
import 'package:clt/models/actions/action_codebase_push.dart';
import 'package:clt/models/actions/action_codebase_ticket_creation.dart';
import 'package:clt/models/actions/action_codebase_ticket_update.dart';
import 'package:clt/models/actions/action_github_issue.dart';
import 'package:clt/models/actions/action_github_issue_comment.dart';
import 'package:clt/models/actions/action_github_label.dart';
import 'package:clt/models/actions/action_github_milestone.dart';
import 'package:clt/models/actions/action_github_pull_request.dart';
import 'package:clt/models/actions/action_gitlab_comment.dart';
import 'package:clt/models/actions/action_gitlab_issue.dart';
import 'package:clt/models/actions/action_gitlab_merge_request.dart';
import 'package:clt/models/actions/action_gitlab_wiki.dart';
import 'package:clt/models/actions/action_github_push.dart';
import 'dart:core';
import 'package:clt/models/reactions/reaction_discord_message.dart';
import 'package:clt/models/reactions/reaction_mail.dart';
import 'package:clt/models/reactions/reaction_twitter_follow_user.dart';
import 'package:clt/models/reactions/reaction_twitter_like.dart';
import 'package:clt/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:clt/models/reactions/reaction_twitter_retwet.dart';
import 'package:clt/views/home/home.dart';

class SetupModel {
  void getServices(God god) async {
    final url = Uri.parse('$urlPrefix/service_list');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final response = await get(url, headers: header);
    var splitted = [];
    if (response.body.length > 2) splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final serviceData = splitted.first.split('=');
      Service service = Service(
          name: serviceData.elementAt(0), token: serviceData.elementAt(1));
      god.globalContainer.service.add(service);
      splitted.removeAt(0);
    }
  }

  void getActions(God god) async {
    final url = Uri.parse('$urlPrefix/action_list');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      if (actionData.length == 3) {
        switch (actionData.elementAt(2)) {
          case "codebase_merge_request":
            {
              ActionCodebaseMergeRequest action = ActionCodebaseMergeRequest();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodeBaseMergeRequest(action.id, action, god);
              god.globalContainer.actionCodebaseMergeRequest.add(action);
            }
            break;
          case "codebase_push":
            {
              ActionCodebasePush action = ActionCodebasePush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodebasePush(action.id, action, god);
              god.globalContainer.actionCodebasePush.add(action);
            }
            break;
          case "codebase_ticket_creation":
            {
              ActionCodebaseTicketCreation action =
                  ActionCodebaseTicketCreation();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodeBaseTicketCreation(action.id, action, god);
              god.globalContainer.actionCodebaseTicketCreation.add(action);
            }
            break;
          case "codebase_ticket_update":
            {
              ActionCodebaseTicketUpdate action = ActionCodebaseTicketUpdate();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodeBaseTicketUpdate(action.id, action, god);
              god.globalContainer.actionCodebaseTicketUpdate.add(action);
            }
            break;
          case "github_issue_comment":
            {
              ActionGithubIssueComment action = ActionGithubIssueComment();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssueComment(action.id, action, god);
              god.globalContainer.actionGithubIssueComment.add(action);
            }
            break;
          case "github_issue":
            {
              ActionGithubIssue action = ActionGithubIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssue(action.id, action, god);
              god.globalContainer.actionGithubIssue.add(action);
            }
            break;
          case "github_label":
            {
              ActionGithubLabel action = ActionGithubLabel();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubLabel(action.id, action, god);
              god.globalContainer.actionGithubLabel.add(action);
            }
            break;
          case "github_milestone":
            {
              ActionGithubMilestone action = ActionGithubMilestone();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubMilestone(action.id, action, god);
              god.globalContainer.actionGithubMilestone.add(action);
            }
            break;
          case "github_pull_request":
            {
              ActionGithubPullRequest action = ActionGithubPullRequest();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubPullRequest(action.id, action, god);
              god.globalContainer.actionGithubPullRequest.add(action);
            }
            break;
          case "github_push":
            {
              ActionGithubPush action = ActionGithubPush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubPush(action.id, action, god);
              god.globalContainer.actionGithubPush.add(action);
            }
            break;
          case "github_issues":
            {
              ActionGithubIssue action = ActionGithubIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssue(action.id, action, god);
              god.globalContainer.actionGithubIssue.add(action);
            }
            break;
          case "gitlab_comment_events":
            {
              ActionGitlabComment action = ActionGitlabComment();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabComment(action.id, action, god);
              god.globalContainer.actionGitlabComment.add(action);
            }
            break;
          case "gitlab_issues_events":
            {
              ActionGitlabIssue action = ActionGitlabIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabIssue(action.id, action, god);
              god.globalContainer.actionGitlabIssue.add(action);
            }
            break;
          case "gitlab_merge_requests_events":
            {
              ActionGitlabMergeRequest action = ActionGitlabMergeRequest();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabMergeRequest(action.id, action, god);
              god.globalContainer.actionGitlabMergeRequest.add(action);
            }
            break;
          case "gitlab_push_events":
            {
              ActionGitlabPush action = ActionGitlabPush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabPush(action.id, action, god);
              god.globalContainer.actionGitlabPush.add(action);
            }
            break;
          case "gitlab_wiki_events":
            {
              ActionGitlabWiki action = ActionGitlabWiki();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabWiki(action.id, action, god);
              god.globalContainer.actionGitlabWiki.add(action);
            }
            break;
          default:
            {}
            break;
        }
      }
      splitted.removeAt(0);
    }
  }

  void getReactionCodeBaseMergeRequest(
      String id, ActionCodebaseMergeRequest action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionCodebasePush(
      String id, ActionCodebasePush action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionCodeBaseTicketCreation(
      String id, ActionCodebaseTicketCreation action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionCodeBaseTicketUpdate(
      String id, ActionCodebaseTicketUpdate action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubIssueComment(
      String id, ActionGithubIssueComment action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubIssue(
      String id, ActionGithubIssue action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubLabel(
      String id, ActionGithubLabel action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubMilestone(
      String id, ActionGithubMilestone action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubPullRequest(
      String id, ActionGithubPullRequest action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGithubPush(
      String id, ActionGithubPush action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGitlabComment(
      String id, ActionGitlabComment action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGitlabIssue(
      String id, ActionGitlabIssue action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGitlabMergeRequest(
      String id, ActionGitlabMergeRequest action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGitlabPush(
      String id, ActionGitlabPush action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }

  void getReactionGitlabWiki(
      String id, ActionGitlabWiki action, God god) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + god.globalToken, "id": id};
    final response = await get(url, headers: header);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_classic_reaction":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "mail_reaction":
          {
            ReactionMail reaction = ReactionMail();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionMail.add(reaction);
          }
          break;
        case "twitter_follow":
          {
            ReactionTwitterFollowUser reaction = ReactionTwitterFollowUser();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterFollowUser.add(reaction);
          }
          break;
        case "twitter_like":
          {
            ReactionTwitterLike reaction = ReactionTwitterLike();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterLike.add(reaction);
          }
          break;
        case "twitter_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_retweet":
          {
            ReactionTwitterRetweet reaction = ReactionTwitterRetweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterRetweet.add(reaction);
          }
          break;
        default:
          {}
          break;
      }
      splitted.removeAt(0);
    }
  }
}
