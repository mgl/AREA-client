import 'dart:async';

import 'package:client/views/home/home.dart';
import 'package:client/views/reaction/add_reaction_page.dart';
import 'package:flutter/material.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebasePushReactionPage extends StatefulWidget {
  const ActionCodebasePushReactionPage(
      {Key? key,
      required this.id,
      required this.god,
      required this.globalToken})
      : super(key: key);

  final String id;
  final God god;
  final String globalToken;

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
        i < widget.god.globalContainer.actionCodebasePush.length;
        i++) {
      if (widget.god.globalContainer.actionCodebasePush[i].id == widget.id) {
        reactionDiscordMessage = widget
            .god.globalContainer.actionCodebasePush[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent = widget.god.globalContainer
            .actionCodebasePush[i].reactionGoogleCalendarEvent;
        reactionTwitterFollowUser = widget.god.globalContainer
            .actionCodebasePush[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = widget.god.globalContainer
            .actionCodebasePush[i].reactionTwitterFollowUser;
        reactionTwitterLike = widget
            .god.globalContainer.actionCodebasePush[i].reactionTwitterLike;
        reactionTwitterPostTweet = widget
            .god.globalContainer.actionCodebasePush[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = widget
            .god.globalContainer.actionCodebasePush[i].reactionTwitterRetweet;
      }
    }
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateToAddReaction() {
    Route route = MaterialPageRoute(
        builder: (context) => AddReactionPage(
            id: widget.id, god: widget.god, globalToken: widget.globalToken));
    Navigator.push(context, route).then(onGoBack);
  }

  @override
  Widget build(BuildContext context) {
    getReaction();
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            onPressed: navigateToAddReaction,
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
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
