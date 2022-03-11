import 'package:flutter/material.dart';
import 'package:client/models/globals.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';
import 'package:client/views/reaction/add_reaction_page.dart';

class ActionGitlabPushReactionPage extends StatefulWidget {
  const ActionGitlabPushReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionGitlabPushReactionPage> createState() =>
      _ActionGitlabPushReactionPageState();
}

class _ActionGitlabPushReactionPageState
    extends State<ActionGitlabPushReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionGoogleCalendarEvent> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0; i < globalContainer.actionGitlabPush.length; i++) {
      if (globalContainer.actionGitlabPush[i].id == widget.id) {
        reactionDiscordMessage =
            globalContainer.actionGitlabPush[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent =
            globalContainer.actionGitlabPush[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser =
            globalContainer.actionGitlabPush[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser =
            globalContainer.actionGitlabPush[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            globalContainer.actionGitlabPush[i].reactionTwitterLike;
        reactionTwitterPostTweet =
            globalContainer.actionGitlabPush[i].reactionTwitterPostTweet;
        reactionTwitterRetweet =
            globalContainer.actionGitlabPush[i].reactionTwitterRetweet;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getReaction();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const AddReactionPage())),
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(title: const Text('Reaction List')),
        body: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(20)),
            child: Scrollbar(
                child: ListView(children: [
              for (int i = 0; i < reactionDiscordMessage.length; i++)
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
              for (int i = 0; i < reactionGoogleCalendarEvent.length; i++)
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
              for (int i = 0; i < reactionTwitterFollowUser.length; i++)
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
              for (int i = 0; i < reactionTwitterLike.length; i++)
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
              for (int i = 0; i < reactionTwitterPostTweet.length; i++)
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
              for (int i = 0; i < reactionTwitterRetweet.length; i++)
                ListTile(
                    leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage('assets/epilogo.png')),
                    title: const Text('Retweet'),
                    subtitle: const Text('Twetter'),
                    trailing: Row(children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.delete))
                    ]))
            ]))));
  }
}
