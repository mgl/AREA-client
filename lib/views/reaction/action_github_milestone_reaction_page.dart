import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubMilestoneReactionPage extends StatefulWidget {
  const ActionGithubMilestoneReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGithubMilestoneReactionPage> createState() => _ActionGithubMilestoneReactionPageState();
}

class _ActionGithubMilestoneReactionPageState extends State<ActionGithubMilestoneReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGithubMilestone.length;
        i++) {
      if (globalContainer.actionGithubMilestone[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGithubMilestone[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGithubMilestone[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGithubMilestone[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGithubMilestone[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGithubMilestone[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGithubMilestone[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGithubMilestone[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}