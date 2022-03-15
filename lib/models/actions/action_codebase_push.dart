import 'package:client/models/reactions/reaction_discord_message.dart';
import 'package:client/models/reactions/reaction_mail.dart';
import 'package:client/models/reactions/reaction_twitter_follow_user.dart';
import 'package:client/models/reactions/reaction_twitter_like.dart';
import 'package:client/models/reactions/reaction_twitter_post_tweet.dart';
import 'package:client/models/reactions/reaction_twitter_retwet.dart';

class ActionCodebasePush {
  String id = "";
  String token = "";
    String url =
      "https://europe-west1-area-37a17.cloudfunctions.net/api/services/codebase/webhook";
  List<ReactionDiscordMessage> reactionDiscordMessage = [];
  List<ReactionMail> reactionMail = [];
  List<ReactionTwitterFollowUser> reactionTwitterFollowUser = [];
  List<ReactionTwitterLike> reactionTwitterLike = [];
  List<ReactionTwitterPostTweet> reactionTwitterPostTweet = [];
  List<ReactionTwitterRetweet> reactionTwitterRetweet = [];
}
