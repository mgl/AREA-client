import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubIssueReactionPage extends StatefulWidget {
  const ActionGithubIssueReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionGithubIssueReactionPage> createState() =>
      _ActionGithubIssueReactionPageState();
}

class _ActionGithubIssueReactionPageState
    extends State<ActionGithubIssueReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0; i < globalContainer.actionGithubIssue.length; i++) {
      if (globalContainer.actionGithubIssue[i].id == widget.id) {
        reactionDiscordMessage =
            globalContainer.actionGithubIssue[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent =
            globalContainer.actionGithubIssue[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser =
            globalContainer.actionGithubIssue[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser =
            globalContainer.actionGithubIssue[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGithubIssue[i].reactionTwitterLike;
        reactionTwitterPostTweet =
            globalContainer.actionGithubIssue[i].reactionTwitterPostTweet;
        reactionTwitterRetweet =
            globalContainer.actionGithubIssue[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getReaction();
    return Scaffold(
        appBar: AppBar(title: const Text('Reaction List')),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
              child: ListView(
                children: [
                  for (int i = 1; i < reactionDiscordMessage.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Message'),
                        subtitle: const Text('Discord'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                  for (int i = 1; i < reactionGoogleCalendarEvent.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Calendar Event'),
                        subtitle: const Text('Google'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                  for (int i = 1; i < reactionTwitterFollowUser.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Follow User'),
                        subtitle: const Text('Twitter'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                  for (int i = 1; i < reactionTwitterLike.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Like'),
                        subtitle: const Text('Twitter'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                  for (int i = 1; i < reactionTwitterPostTweet.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Post Tweet'),
                        subtitle: const Text('Tweeter'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                  for (int i = 1; i < reactionTwitterRetweet.length; i++)
                    ListTile(
                        leading: const CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage('assets/epilogo.png')),
                        title: const Text('Retweet'),
                        subtitle: const Text('Twetter'),
                        trailing: Row(children: [
                          IconButton(
                              onPressed: () {}, icon: const Icon(Icons.delete))
                        ])),
                ],
              ),
            )));
  }
}
