import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabMergeRequestReactionPage extends StatefulWidget {
  const ActionGitlabMergeRequestReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGitlabMergeRequestReactionPage> createState() => _ActionGitlabMergeRequestReactionPageState();
}

class _ActionGitlabMergeRequestReactionPageState extends State<ActionGitlabMergeRequestReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (globalContainer.actionGitlabMergeRequest[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGitlabMergeRequest[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGitlabMergeRequest[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabMergeRequest[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}