import 'package:client/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebaseTicketUpdateReactionPage extends StatefulWidget {
  const ActionCodebaseTicketUpdateReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionCodebaseTicketUpdateReactionPage> createState() => _ActionCodebaseTicketUpdateReactionPageState();
}

class _ActionCodebaseTicketUpdateReactionPageState extends State<ActionCodebaseTicketUpdateReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionCodebaseTicketUpdate.length;
        i++) {
      if (globalContainer.actionCodebaseTicketUpdate[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionCodebaseTicketUpdate[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionCodebaseTicketUpdate[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseTicketUpdate[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionCodebaseTicketUpdate[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionCodebaseTicketUpdate[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionCodebaseTicketUpdate[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionCodebaseTicketUpdate[i].reactionTwitterRetweet;
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}