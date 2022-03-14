import 'package:client/models/add_reaction_model.dart';
import 'package:client/views/home/home.dart';

class AddReactionController {
  static void reactionMail(String actionId, String object, String content,
          String receiver, God god, String globalToken) =>
      AddReactionModel()
          .mailReaction(actionId, object, content, receiver, globalToken, god);
  static void reactionDiscord(String actionId, String message, String server,
          String channel, God god, String globalToken) =>
      AddReactionModel().discordReaction(
          actionId, message, server, channel, globalToken, god);

  static void reactionPostTweet(
          String actionId, String message, God god, String globalToken) =>
      AddReactionModel()
          .twitterTweetReaction(actionId, message, globalToken, god);

  static void reactionTwitterLike(
          String actionId, String tweetId, God god, String globalToken) =>
      AddReactionModel()
          .twitterLikeReaction(actionId, tweetId, globalToken, god);

  static void reactionTwitterFollow(
          String actionId, String userName, God god, String globalToken) =>
      AddReactionModel()
          .twitterFollowReaction(actionId, userName, globalToken, god);

  static void reactionTwitterRetweet(
          String actionId, String tweetId, God god, String globalToken) =>
      AddReactionModel()
          .twitterRetweetReaction(actionId, tweetId, globalToken, god);
}
