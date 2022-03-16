import 'package:clt/models/subscribe_model.dart';
import 'package:clt/views/home/home.dart';

class SubscribeController {
  static Future subscribeGithub(String value, God god) async {
    return SubscribeModel().subscribeGithub(value, god);
  }

   static void unsubscribeGithub(God god) => SubscribeModel().unsubscribeGithub(god);

  static Future subscribeCodebase(
      String apiKey, String userName, God god) async {
    return SubscribeModel().subscribeCodebase(apiKey, userName, god);
  }

   static void unsubscribeCodebase(God god) => SubscribeModel().unsubscribeCodebase(god);

  static Future subscribeGitlab(String value, God god) async {
    return SubscribeModel().subscribeGitlab(value, god);
  }

   static void unsubscribeGitlab(God god) => SubscribeModel().unsubscribeGitlab(god);

  static Future subscribeDiscord(God god) async {
    return SubscribeModel().subscribeDiscord(god);
  }

   static void unsubscribeDiscord(God god) => SubscribeModel().unsubscribeDiscord(god);

  static Future subscribeMail(
      String username, String appPasword, God god) async {
    return SubscribeModel().subscribeMail(username, appPasword, god);
  }

   static Future unsubscribeMail(God god) async {
    return await SubscribeModel().unsubscribeMail(god);

   }

  static Future subscribeTwitter(String accessToken, String accessPassword,
      String appKeyToken, String appPassword, God god) async {
    return SubscribeModel().subscribeTwitter(
        accessToken, accessPassword, appKeyToken, appPassword, god);
  }

  static void unsubscribeTwitter(God god) => SubscribeModel().unsubscribeTwitter(god);
}
