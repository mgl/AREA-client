import 'dart:async';

import 'package:clt/views/add_reaction_page.dart/add_reaction_page.dart';
import 'package:flutter/material.dart';
import 'package:clt/models/reactions/reaction_discord_message.dart';
import 'package:clt/models/reactions/reaction_mail.dart';
import 'package:clt/models/reactions/reaction_twitter_follow_user.dart';
import 'package:clt/models/reactions/reaction_twitter_like.dart';
import 'package:clt/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:clt/models/reactions/reaction_twitter_retwet.dart';
import 'package:clt/views/home/home.dart';

class ActionGitlabWikiReactionPage extends StatefulWidget {
  const ActionGitlabWikiReactionPage(
      {Key? key, required this.id, required this.god})
      : super(key: key);

  final String id;
  final God god;
  @override
  State<ActionGitlabWikiReactionPage> createState() =>
      _ActionGitlabWikiReactionPageState();
}

class _ActionGitlabWikiReactionPageState
    extends State<ActionGitlabWikiReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionMail> reactionGoogleCalendarEvent = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabWiki.length;
        i++) {
      if (widget.god.globalContainer.actionGitlabWiki[i].id == widget.id) {
        reactionDiscordMessage = widget
            .god.globalContainer.actionGitlabWiki[i].reactionDiscordMessage;
        reactionGoogleCalendarEvent =
            widget.god.globalContainer.actionGitlabWiki[i].reactionMail;
        reactionTwitterFollowUser = widget
            .god.globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = widget
            .god.globalContainer.actionGitlabWiki[i].reactionTwitterFollowUser;
        reactionTwitterLike =
            widget.god.globalContainer.actionGitlabWiki[i].reactionTwitterLike;
        reactionTwitterPostTweet = widget
            .god.globalContainer.actionGitlabWiki[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = widget
            .god.globalContainer.actionGitlabWiki[i].reactionTwitterRetweet;
      }
    }
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  void navigateToAddReaction() {
    Route route = MaterialPageRoute(
        builder: (context) => AddReactionPage(id: widget.id, god: widget.god));
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
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Discord - Message')
                    ])),
              for (int i = 0; i < reactionGoogleCalendarEvent.length; i++)
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Mail - Message')
                    ])),
              for (int i = 0; i < reactionTwitterFollowUser.length; i++)
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Twitter - Follow')
                    ])),
              for (int i = 0; i < reactionTwitterLike.length; i++)
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Twitter - Like')
                    ])),
              for (int i = 0; i < reactionTwitterPostTweet.length; i++)
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Twitter - Post')
                    ])),
              for (int i = 0; i < reactionTwitterRetweet.length; i++)
                TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {},
                    child: Row(children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/code.png'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 20),
                      const Text('Twitter - Retweet')
                    ])),
            ]))));
  }
}
