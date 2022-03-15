import 'package:clt/models/reactions/reaction_discord_message.dart';
import 'package:clt/models/reactions/reaction_mail.dart';
import 'package:clt/models/reactions/reaction_twitter_follow_user.dart';
import 'package:clt/models/reactions/reaction_twitter_like.dart';
import 'package:clt/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:clt/models/reactions/reaction_twitter_retwet.dart';

class ActionGithubPush {
  String id = "";
  String token = "";
  String owner = "";
  String repo = "";
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionMail> reactionMail = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];
}
