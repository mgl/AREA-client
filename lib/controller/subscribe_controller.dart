import 'package:client/models/subscribe_model.dart';
import 'package:client/views/home/home.dart';

class SubscribeController {
  static Future subscribeGithub(String value, God god) async {
    return SubscribeModel().subscribeGithub(value, god);
  }

  // static void unsubscribeGithub() => SubscribeModel().unsubscribeGithub();

  static Future subscribeCodebase(
      String apiKey, String userName, God god) async {
    return SubscribeModel().subscribeCodebase(apiKey, userName, god);
  }

  // static void unsubscribeCodebase() => SubscribeModel().unsubscribeCodebase();

  static Future subscribeGitlab(String value, God god) async {
    return SubscribeModel().subscribeGitlab(value, god);
  }

  // static void unsubscribeGitlab() => SubscribeModel().unsubscribeGitlab();

  static Future subscribeDiscord(God god) async {
    return SubscribeModel().subscribeDiscord(god);
  }

  // static void unsubscribeDiscord() => SubscribeModel().unsubscribeDiscord();

  static Future subscribeMail(
      String username, String appPasword, God god) async {
    return SubscribeModel().subscribeMail(username, appPasword, god);
  }

  // static Future unsubscribeGoogle() async {
  //  return await SubscribeModel().unsubscribeGoogle();

  // }

  static Future subscribeTwitter(String accessToken ,String accessPassword, String appKeyToken, String appPassword, God god) async {
    return SubscribeModel().subscribeTwitter(accessToken, accessPassword, appKeyToken, appPassword, god);
  }

  // static void unsubscribeTwitter() => SubscribeModel().unsubscribeTwitter();
}
