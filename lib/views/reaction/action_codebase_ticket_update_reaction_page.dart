import 'package:client/models/globals.dart';
import 'package:flutter/material.dart';
import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_google_calendar_event.dart';
import 'package:client/views/reaction/add_reaction_page.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebaseTicketUpdateReactionPage extends StatefulWidget {
  const ActionCodebaseTicketUpdateReactionPage({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<ActionCodebaseTicketUpdateReactionPage> createState() =>
      _ActionCodebaseTicketUpdateReactionPageState();
}

class _ActionCodebaseTicketUpdateReactionPageState
    extends State<ActionCodebaseTicketUpdateReactionPage> {
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
    getReaction();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const AddReactionPage();
              }));
            },
            backgroundColor: Colors.deepPurple,
            child: const Icon(Icons.add, color: Colors.black)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
