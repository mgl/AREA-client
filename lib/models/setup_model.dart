import 'package:client/models/action_container.dart';
import 'package:http/http.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/service.dart';
import 'package:client/models/actions/action_gitlab_push.dart';
import 'package:client/models/actions/action_codebase_merge_request.dart';
import 'package:client/models/actions/action_codebase_push.dart';
import 'package:client/models/actions/action_codebase_ticket_creation.dart';
import 'package:client/models/actions/action_codebase_ticket_update.dart';
import 'package:client/models/actions/action_github_issue.dart';
import 'package:client/models/actions/action_github_issue_comment.dart';
import 'package:client/models/actions/action_github_label.dart';
import 'package:client/models/actions/action_github_milestone.dart';
import 'package:client/models/actions/action_github_pull_request.dart';
import 'package:client/models/actions/action_gitlab_comment.dart';
import 'package:client/models/actions/action_gitlab_issue.dart';
import 'package:client/models/actions/action_gitlab_merge_request.dart';
import 'package:client/models/actions/action_gitlab_wiki.dart';
import 'package:client/models/actions/action_github_push.dart';
import 'dart:core';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';
import 'package:flutter/material.dart';

class SetupModel {
  void getServices(String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/service_list');
    final header = {"Authorization": "Bearer " + globalToken};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text(
            "getServices: " + response.statusCode.toString() + response.body));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final serviceData = splitted.first.split('=');
      Service service = Service(
          name: serviceData.elementAt(0), token: serviceData.elementAt(1));
      globalContainer.service.add(service);
      splitted.removeAt(0);
    }
  }

  void getActions(String globalToken, ActionContainer globalContainer) async {
    final url = Uri.parse('$urlPrefix/action_list');
    final header = {"Authorization": "Bearer " + globalToken};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text(
            "getActions: " + response.statusCode.toString() + response.body));
    snackbarKey.currentState?.showSnackBar(snackBar);
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
              getReactionCodeBaseMergeRequest(action.id, action, globalToken);
              globalContainer.actionCodebaseMergeRequest.add(action);
            }
            break;
          case "codebase_push":
            {
              ActionCodebasePush action = ActionCodebasePush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodebasePush(action.id, action, globalToken);
              globalContainer.actionCodebasePush.add(action);
            }
            break;
          case "codebase_ticket_creation":
            {
              ActionCodebaseTicketCreation action =
                  ActionCodebaseTicketCreation();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodeBaseTicketCreation(action.id, action, globalToken);
              globalContainer.actionCodebaseTicketCreation.add(action);
            }
            break;
          case "codebase_ticket_update":
            {
              ActionCodebaseTicketUpdate action = ActionCodebaseTicketUpdate();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionCodeBaseTicketUpdate(action.id, action, globalToken);
              globalContainer.actionCodebaseTicketUpdate.add(action);
            }
            break;
          case "github_issue_comment":
            {
              ActionGithubIssueComment action = ActionGithubIssueComment();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssueComment(action.id, action, globalToken);
              globalContainer.actionGithubIssueComment.add(action);
            }
            break;
          case "github_issue":
            {
              ActionGithubIssue action = ActionGithubIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssue(action.id, action, globalToken);
              globalContainer.actionGithubIssue.add(action);
            }
            break;
          case "github_label":
            {
              ActionGithubLabel action = ActionGithubLabel();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubLabel(action.id, action, globalToken);
              globalContainer.actionGithubLabel.add(action);
            }
            break;
          case "github_milestone":
            {
              ActionGithubMilestone action = ActionGithubMilestone();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubMilestone(action.id, action, globalToken);
              globalContainer.actionGithubMilestone.add(action);
            }
            break;
          case "github_pull_request":
            {
              ActionGithubPullRequest action = ActionGithubPullRequest();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubPullRequest(action.id, action, globalToken);
              globalContainer.actionGithubPullRequest.add(action);
            }
            break;
          case "github_push":
            {
              ActionGithubPush action = ActionGithubPush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubPush(action.id, action, globalToken);
              globalContainer.actionGithubPush.add(action);
            }
            break;
          case "github_issues":
            {
              ActionGithubIssue action = ActionGithubIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGithubIssue(action.id, action, globalToken);
              globalContainer.actionGithubIssue.add(action);
            }
            break;
          case "gitlab_comment":
            {
              ActionGitlabComment action = ActionGitlabComment();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabComment(action.id, action, globalToken);
              globalContainer.actionGitlabComment.add(action);
            }
            break;
          case "gitlab_issue":
            {
              ActionGitlabIssue action = ActionGitlabIssue();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabIssue(action.id, action, globalToken);
              globalContainer.actionGitlabIssue.add(action);
            }
            break;
          case "gitlab_merge_request":
            {
              ActionGitlabMergeRequest action = ActionGitlabMergeRequest();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabMergeRequest(action.id, action, globalToken);
              globalContainer.actionGitlabMergeRequest.add(action);
            }
            break;
          case "gitlab_push":
            {
              ActionGitlabPush action = ActionGitlabPush();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabPush(action.id, action, globalToken);
              globalContainer.actionGitlabPush.add(action);
            }
            break;
          case "gitlab_wiki":
            {
              ActionGitlabWiki action = ActionGitlabWiki();
              action.id = actionData.elementAt(0);
              action.token = actionData.elementAt(1);
              getReactionGitlabWiki(action.id, action, globalToken);
              globalContainer.actionGitlabWiki.add(action);
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
      String id, ActionCodebaseMergeRequest action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text("getReactionCodeBaseMergeRequest: " +
            response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionCodebasePush(String id, ActionCodebasePush action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionCodebasePush: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionCodeBaseTicketCreation(String id,
      ActionCodebaseTicketCreation action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text("getReactionCodeBaseTicketCreation: " +
            response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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
      String id, ActionCodebaseTicketUpdate action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text("getReactionCodeBaseTicketUpdate: " +
            response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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
      String id, ActionGithubIssueComment action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text("getReactionGithubIssueComment: " +
            response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGithubIssue(String id, ActionGithubIssue action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGithubIssue: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGithubLabel(String id, ActionGithubLabel action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGithubLabe: l" + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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
      String id, ActionGithubMilestone action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text(
            "getReactionGithubMilestone: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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
      String id, ActionGithubPullRequest action, String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text(
            "getReactionGithubPullRequest: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGithubPush(String id, ActionGithubPush action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGithubPush: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGitlabComment(String id, ActionGitlabComment action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text(
            "getReactionGitlabComment: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGitlabIssue(String id, ActionGitlabIssue action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGitlabIssue: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGitlabMergeRequest(String id, ActionGitlabMergeRequest action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content: Text("getReactionGitlabMergeRequest: " +
            response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGitlabPush(String id, ActionGitlabPush action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGitlabPush: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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

  void getReactionGitlabWiki(String id, ActionGitlabWiki action,
      String globalToken) async {
    final url = Uri.parse('$urlPrefix/reaction_list');
    final header = {"Authorization": "Bearer " + globalToken, "id": id};
    final response = await get(url, headers: header);
    final SnackBar snackBar = SnackBar(
        content:
            Text("getReactionGitlabWiki: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
    final splitted = response.body.split(';');
    while (splitted.isNotEmpty) {
      final actionData = splitted.first.split('=');
      switch (actionData.elementAt(2)) {
        case "discord_message":
          {
            ReactionDiscordMessage reaction = ReactionDiscordMessage();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionDiscordMessage.add(reaction);
          }
          break;
        case "google_calendar_event":
          {
            ReactionGoogleCalendarEvent reaction =
                ReactionGoogleCalendarEvent();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionGoogleCalendarEvent.add(reaction);
          }
          break;
        case "twitter_follow_user":
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
        case "twitte_post_tweet":
          {
            ReactionTwitterPostTweet reaction = ReactionTwitterPostTweet();
            reaction.id = actionData.elementAt(0);
            reaction.token = actionData.elementAt(1);
            action.reactionTwitterPostTweet.add(reaction);
          }
          break;
        case "twitter_post_retweet":
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
