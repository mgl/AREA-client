import 'package:client/models/globals.dart';
import 'package:client/models/subscribe_model.dart';
import 'package:http/http.dart';

class SubscribeController {
  static void subscribeGithub() {
    SubscribeModel().subscribeGithub();
  }

  static void unsubscribeGithub() {
    SubscribeModel().unsubscribeGithub();
  }

  static void subscribeCodebase() {
    SubscribeModel().subscribeCodebase();
  }

  static void unsubscribeCodebase() {
    SubscribeModel().unsubscribeCodebase();
  }

  static void subscribeGitlab() {
    SubscribeModel().subscribeGitlab();
  }

  static void unsubscribeGitlab() {
    SubscribeModel().unsubscribeGitlab();
  }

  static void subscribeDiscord() {
    SubscribeModel().subscribeDiscord();
  }

  static void unsubscribeDiscord() {
    SubscribeModel().unsubscribeDiscord();
  }

  static void subscribeGoogle() {
    SubscribeModel().subscribeDiscord();
  }

  static void unsubscribeGoogle() {
    SubscribeModel().unsubscribeDiscord();
  }

  static void subscribeTwitter() {
    SubscribeModel().subscribeDiscord();
  }

  static void unsubscribeTwitter() {
    SubscribeModel().unsubscribeDiscord();
  }
}
