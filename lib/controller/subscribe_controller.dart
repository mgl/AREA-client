import 'package:client/models/subscribe_model.dart';
import 'package:client/views/home/home.dart';

class SubscribeController {
  static Future subscribeGithub(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeGithub(value, globalToken, god);
  }

  // static void unsubscribeGithub() => SubscribeModel().unsubscribeGithub();

  static Future subscribeCodebase(
      String apiKey, String userName, String globalToken, God god) async {
    return SubscribeModel().subscribeCodebase(apiKey, userName, globalToken, god);
  }

  // static void unsubscribeCodebase() => SubscribeModel().unsubscribeCodebase();

  static Future subscribeGitlab(
      String value, String globalToken, God god) async {
    return SubscribeModel().subscribeGitlab(value, globalToken, god);
  }

  // static void unsubscribeGitlab() => SubscribeModel().unsubscribeGitlab();

  static Future subscribeDiscord(
     String globalToken, God god) async {
    return SubscribeModel().subscribeDiscord(globalToken, god);
  }

  // static void unsubscribeDiscord() => SubscribeModel().unsubscribeDiscord();

  static Future subscribeGoogle(
      String username, String appPasword, String globalToken, God god) async {
    return SubscribeModel().subscribeGoogle(username, appPasword, globalToken, god);
  }

  // static Future unsubscribeGoogle() async {
  //  return await SubscribeModel().unsubscribeGoogle();

  // }

  static Future subscribeTwitter(
      String bearerToken,
      String globalToken,
      God god) async {
    return SubscribeModel().subscribeTwitter(
        bearerToken, globalToken, god);
  }

  // static void unsubscribeTwitter() => SubscribeModel().unsubscribeTwitter();
}
