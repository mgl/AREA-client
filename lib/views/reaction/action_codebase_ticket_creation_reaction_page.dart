import 'package:client/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebaseTicketCreationReactionPage extends StatefulWidget {
  const ActionCodebaseTicketCreationReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionCodebaseTicketCreationReactionPage> createState() =>
      _ActionCodebaseTicketCreationReactionPageState();
}

class _ActionCodebaseTicketCreationReactionPageState
    extends State<ActionCodebaseTicketCreationReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionCodebaseTicketCreation.length;
        i++) {
      if (globalContainer.actionCodebaseTicketCreation[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionCodebaseTicketCreation[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionCodebaseTicketCreation[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseTicketCreation[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseTicketCreation[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionCodebaseTicketCreation[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionCodebaseTicketCreation[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionCodebaseTicketCreation[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
