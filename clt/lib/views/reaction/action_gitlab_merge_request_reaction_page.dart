import 'dart:async';

import 'package:clt/views/add_reaction_page.dart/add_reaction_page.dart';
import 'package:clt/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:clt/models/reactions/reaction_discord_message.dart';
import 'package:clt/models/reactions/reaction_mail.dart';
import 'package:clt/models/reactions/reaction_twitter_follow_user.dart';
import 'package:clt/models/reactions/reaction_twitter_like.dart';
import 'package:clt/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:clt/models/reactions/reaction_twitter_retwet.dart';

class ActionGitlabMergeRequestReactionPage extends StatefulWidget {
  const ActionGitlabMergeRequestReactionPage(
      {Key? key, required this.id, required this.god})
      : super(key: key);

  final String id;
  final God god;
  @override
  State<ActionGitlabMergeRequestReactionPage> createState() =>
      _ActionGitlabMergeRequestReactionPageState();
}

class _ActionGitlabMergeRequestReactionPageState
    extends State<ActionGitlabMergeRequestReactionPage> {
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionMail> reactionMail = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];

  void getReaction() {
    for (int i = 0;
        i < widget.god.globalContainer.actionGitlabMergeRequest.length;
        i++) {
      if (widget.god.globalContainer.actionGitlabMergeRequest[i].id ==
          widget.id) {
        reactionDiscordMessage = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionDiscordMessage;
        reactionMail =
            widget.god.globalContainer.actionGitlabMergeRequest[i].reactionMail;
        reactionTwitterFollowUser = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterFollowUser = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterFollowUser;
        reactionTwitterLike = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterLike;
        reactionTwitterPostTweet = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterPostTweet;
        reactionTwitterRetweet = widget.god.globalContainer
            .actionGitlabMergeRequest[i].reactionTwitterRetweet;
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
                child: ListView(
                    padding: const EdgeInsets.only(bottom: 8),
                    children: [
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
                  for (int i = 0; i < reactionMail.length; i++)
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
                          const Text('Mail - Reaction')
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
                          const Text('Twitter - Follow User')
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
                          const Text('Twitter - Post a Tweet')
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
                          const Text('Tweeter - Retweet')
                        ])),
                ]))));
  }
}
