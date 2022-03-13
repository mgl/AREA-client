import 'package:client/models/subscribe_model.dart';

class SubscribeController {
  static Future subscribeGithub(String value) async {
    return SubscribeModel().subscribeGithub(value);
  }

  // static void unsubscribeGithub() => SubscribeModel().unsubscribeGithub();

  static Future subscribeCodebase(String value) async {
    return SubscribeModel().subscribeCodebase(value);
  }

  // static void unsubscribeCodebase() => SubscribeModel().unsubscribeCodebase();

  static Future subscribeGitlab(String value) async {
    return SubscribeModel().subscribeGitlab(value);
  }

  // static void unsubscribeGitlab() => SubscribeModel().unsubscribeGitlab();

  static Future subscribeDiscord(String value) async {
    return SubscribeModel().subscribeDiscord(value);
  }

  // static void unsubscribeDiscord() => SubscribeModel().unsubscribeDiscord();

  static Future subscribeGoogle(String value) async {
    return SubscribeModel().subscribeGoogle();
  }

  // static Future unsubscribeGoogle() async {
  //  return await SubscribeModel().unsubscribeGoogle();

  // }

  static Future subscribeTwitter(String appToken, String appSecret,
      String userToken, String userSecret) async {
    return SubscribeModel()
        .subscribeTwitter(appToken, appSecret, userToken, userSecret);
  }

  // static void unsubscribeTwitter() => SubscribeModel().unsubscribeTwitter();
}
