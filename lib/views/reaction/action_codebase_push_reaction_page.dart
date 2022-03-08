import 'package:client/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebasePushReactionPage extends StatefulWidget {
  const ActionCodebasePushReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionCodebasePushReactionPage> createState() =>
      _ActionCodebasePushReactionPageState();
}

class _ActionCodebasePushReactionPageState
    extends State<ActionCodebasePushReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionCodebasePush.length;
        i++) {
      if (globalContainer.actionCodebasePush[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionCodebasePush[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionCodebasePush[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionCodebasePush[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionCodebasePush[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionCodebasePush[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionCodebasePush[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionCodebasePush[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
