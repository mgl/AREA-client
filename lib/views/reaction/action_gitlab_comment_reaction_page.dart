import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabCommentReactionPage extends StatefulWidget {
  const ActionGitlabCommentReactionPage({ Key? key, required this.id }) : super(key: key);

  final String id;

  @override
  State<ActionGitlabCommentReactionPage> createState() => _ActionGitlabCommentReactionPageState();
}

class _ActionGitlabCommentReactionPageState extends State<ActionGitlabCommentReactionPage> {

  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < globalContainer.actionGitlabComment.length;
        i++) {
      if (globalContainer.actionGitlabComment[i].id == widget.id) {
        reactionDiscordMessage = globalContainer
            .actionGitlabComment[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = globalContainer
            .actionGitlabComment[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabComment[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = globalContainer
            .actionGitlabComment[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabComment[i].reactionTwitterLike;
        reactionTwitterPostTweet = globalContainer
            .actionGitlabComment[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = globalContainer
            .actionGitlabComment[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}