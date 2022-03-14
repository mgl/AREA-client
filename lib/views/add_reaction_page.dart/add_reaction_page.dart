import 'package:client/views/add_reaction_page.dart/discord_message_reaction_page.dart';
import 'package:client/views/add_reaction_page.dart/gmail_reaction_page.dart';
import 'package:client/views/add_reaction_page.dart/twitter_follow_user_reaction_page.dart';
import 'package:client/views/add_reaction_page.dart/twitter_like_reaction_page.dart';
import 'package:client/views/add_reaction_page.dart/twitter_post_reaction_page.dart';
import 'package:client/views/add_reaction_page.dart/twitter_retweet_reaction_page.dart';
import 'package:client/views/home/home.dart';
import 'package:flutter/material.dart';

class AddReactionPage extends StatefulWidget {
  const AddReactionPage(
      {Key? key,
      required this.id,
      required this.god,
      required this.globalToken})
      : super(key: key);
  final String id;
  final God god;
  final String globalToken;
  @override
  State<AddReactionPage> createState() => _AddReactionPageState();
}

class _AddReactionPageState extends State<AddReactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Reaction'),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(20)),
          child: Scrollbar(
              child: Column(children: [
            DiscordMessageReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5),
            const SizedBox(height: 5),
            GmailReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5),
            TwitterFollowUserReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5),
            TwitterLikeReactionReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5),
            TwitterPostReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5),
            TwitterRetweetReactionPage(
                globalToken: widget.globalToken,
                god: widget.god,
                id: widget.id),
            const SizedBox(height: 5)
          ])),
        ));
  }
}
