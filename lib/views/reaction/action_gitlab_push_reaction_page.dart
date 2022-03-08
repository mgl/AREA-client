import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabPushReactionPage extends StatefulWidget {
  const ActionGitlabPushReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGitlabPushReactionPage> createState() => _ActionGitlabPushReactionPageState();
}

class _ActionGitlabPushReactionPageState extends State<ActionGitlabPushReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGitlabPush.length;
        i++) {
      if (globalContainer.actionGitlabPush[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGitlabPush[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGitlabPush[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabPush[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabPush[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabPush[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGitlabPush[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGitlabPush[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}