import 'package:client/models/subscribe_model.dart';
import 'package:client/views/home/home.dart';

class SubscribeController {
  static Future subscribeGithub(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeGithub(value, globalToken, god);
  }

  // static void unsubscribeGithub() => SubscribeModel().unsubscribeGithub();

  static Future subscribeCodebase(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeCodebase(value, globalToken, god);
  }

  // static void unsubscribeCodebase() => SubscribeModel().unsubscribeCodebase();

  static Future subscribeGitlab(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeGitlab(value, globalToken, god);
  }

  // static void unsubscribeGitlab() => SubscribeModel().unsubscribeGitlab();

  static Future subscribeDiscord(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeDiscord(value, globalToken, god);
  }

  // static void unsubscribeDiscord() => SubscribeModel().unsubscribeDiscord();

  static Future subscribeGoogle(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeGoogle(globalToken, god);
  }

  // static Future unsubscribeGoogle() async {
  //  return await SubscribeModel().unsubscribeGoogle();

  // }

  static Future subscribeTwitter(
      String appToken,
      String appSecret,
      String userToken,
      String userSecret,
      String globalToken,
      God god) async {
    return SubscribeModel().subscribeTwitter(
        appToken, appSecret, userToken, userSecret, globalToken, god);
  }

  // static void unsubscribeTwitter() => SubscribeModel().unsubscribeTwitter();
}
