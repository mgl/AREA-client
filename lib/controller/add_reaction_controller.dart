import 'package:client/models/add_reaction_model.dart';
import 'package:client/views/home/home.dart';

class AddReactionController {
  static void reactionMail(String actionId, String object, String content,
          String receiver, God god) =>
      AddReactionModel().mailReaction(actionId, object, content, receiver, god);
  static void reactionDiscord(String actionId, String message, String server,
          String channel, God god) =>
      AddReactionModel()
          .discordReaction(actionId, message, server, channel, god);

  static void reactionPostTweet(String actionId, String message, God god) =>
      AddReactionModel().twitterTweetReaction(actionId, message, god);

  static void reactionTwitterLike(String actionId, String tweetId, God god) =>
      AddReactionModel().twitterLikeReaction(actionId, tweetId, god);

  static void reactionTwitterFollow(
          String actionId, String userName, God god) =>
      AddReactionModel().twitterFollowReaction(actionId, userName, god);

  static void reactionTwitterRetweet(
          String actionId, String tweetId, God god) =>
      AddReactionModel().twitterRetweetReaction(actionId, tweetId, god);
}
