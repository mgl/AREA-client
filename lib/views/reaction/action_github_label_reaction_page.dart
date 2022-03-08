import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubLabelReactionPage extends StatefulWidget {
  const ActionGithubLabelReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGithubLabelReactionPage> createState() => _ActionGithubLabelReactionPageState();
}

class _ActionGithubLabelReactionPageState extends State<ActionGithubLabelReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGithubLabel.length;
        i++) {
      if (globalContainer.actionGithubLabel[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGithubLabel[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGithubLabel[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGithubLabel[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGithubLabel[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGithubLabel[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGithubLabel[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGithubLabel[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}