import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebaseMergeRequestReactionPage extends StatefulWidget {
  const ActionCodebaseMergeRequestReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionCodebaseMergeRequestReactionPage> createState() =>
      _ActionCodebaseMergeRequestReactionPageState();
}

class _ActionCodebaseMergeRequestReactionPageState
    extends State<ActionCodebaseMergeRequestReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionCodebaseMergeRequest.length;
        i++) {
      if (globalContainer.actionCodebaseMergeRequest[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionCodebaseMergeRequest[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionCodebaseMergeRequest[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionCodebaseMergeRequest[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionCodebaseMergeRequest[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionCodebaseMergeRequest[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
