import 'package:client/models/subscribe_model.dart';

class SubscribeController {
  static void subscribeGithub(String value) =>
      SubscribeModel().subscribeGithub(value);

  static void unsubscribeGithub() => SubscribeModel().unsubscribeGithub();

  static void subscribeCodebase(String value) =>
      SubscribeModel().subscribeCodebase(value);

  static void unsubscribeCodebase() => SubscribeModel().unsubscribeCodebase();

  static void subscribeGitlab(String value) =>
      SubscribeModel().subscribeGitlab(value);

  static void unsubscribeGitlab() => SubscribeModel().unsubscribeGitlab();

  static void subscribeDiscord(String value) =>
      SubscribeModel().subscribeDiscord(value);

  static void unsubscribeDiscord() => SubscribeModel().unsubscribeDiscord();

  static void subscribeGoogle(String value) =>
      SubscribeModel().subscribeGoogle();

  static void unsubscribeGoogle() => SubscribeModel().unsubscribeDiscord();

  static void subscribeTwitter(String appToken, String appSecret,
          String userToken, String userSecret) =>
      SubscribeModel()
          .subscribeTwitter(appToken, appSecret, userToken, userSecret);

  static void unsubscribeTwitter() => SubscribeModel().unsubscribeDiscord();
}
