import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabIssueReactionPage extends StatefulWidget {
  const ActionGitlabIssueReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGitlabIssueReactionPage> createState() => _ActionGitlabIssueReactionPageState();
}

class _ActionGitlabIssueReactionPageState extends State<ActionGitlabIssueReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGitlabIssue.length;
        i++) {
      if (globalContainer.actionGitlabIssue[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGitlabIssue[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGitlabIssue[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabIssue[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabIssue[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabIssue[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGitlabIssue[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGitlabIssue[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}