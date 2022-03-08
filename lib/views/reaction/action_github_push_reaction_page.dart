import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubPushReactionPage extends StatefulWidget {
  const ActionGithubPushReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGithubPushReactionPage> createState() => _ActionGithubPushReactionPageState();
}

class _ActionGithubPushReactionPageState extends State<ActionGithubPushReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGithubPush.length;
        i++) {
      if (globalContainer.actionGithubPush[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGithubPush[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGithubPush[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGithubPush[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGithubPush[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGithubPush[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGithubPush[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGithubPush[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}