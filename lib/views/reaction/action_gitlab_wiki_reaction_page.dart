import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabWikiReactionPage extends StatefulWidget {
  const ActionGitlabWikiReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionGitlabWikiReactionPage> createState() =>
      _ActionGitlabWikiReactionPageState();
}

class _ActionGitlabWikiReactionPageState
    extends State<ActionGitlabWikiReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0; i < globalContainer.actionGitlabWiki.length; i++) {
      if (globalContainer.actionGitlabWiki[i].id == widget.id) {
        reactionDiscordMessage =
            globalContainer.actionGitlabWiki[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent =
            globalContainer.actionGitlabWiki[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser =
            globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser =
            globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabWiki[i].reactionTwitterLike;
        reactionTwitterPostTweet =
            globalContainer.actionGitlabWiki[i].reactionTwitterPostTweet;
        reactionTwitterRetweet =
            globalContainer.actionGitlabWiki[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: AppBar(title: const Text('Reaction List')),
    //     body: Container(
    //         decoration: BoxDecoration(
    //             border: Border.all(color: Colors.deepPurple),
    //             borderRadius: BorderRadius.circular(20)),
    //         child: Scrollbar(
    //           child: ListView(
    //             children: [
    //               for (int i = 1; i < reactionDiscordMessage.length; i++)
    //                 CheckboxListTile(
    //                     title: const Text('Message'),
    //                     subtitle: const Text('Discord'),
    //                     secondary: const Icon(Icons.code),
    //                     autofocus: false,
    //                     activeColor: Colors.green,
    //                     checkColor: Colors.white,
    //                     selected: _values[i]!,
    //                     value: _values[i],
    //                     onChanged: (bool? value) {
    //                       setState(() {
    //                         _values[i] = value;
    //                       });
    //                     })
    //             ],
    //           ),
    //         )));
    return Container();
  }
}
