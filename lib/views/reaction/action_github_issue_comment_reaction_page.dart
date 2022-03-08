import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubIssueCommentReactionPage extends StatefulWidget {
  const ActionGithubIssueCommentReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGithubIssueCommentReactionPage> createState() => _ActionGithubIssueCommentReactionPageState();
}

class _ActionGithubIssueCommentReactionPageState extends State<ActionGithubIssueCommentReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGithubIssueComment.length;
        i++) {
      if (globalContainer.actionGithubIssueComment[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGithubIssueComment[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGithubIssueComment[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGithubIssueComment[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGithubIssueComment[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGithubIssueComment[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGithubIssueComment[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGithubIssueComment[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}