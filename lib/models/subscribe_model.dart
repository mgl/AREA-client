import 'package:client/models/globals.dart';
import 'package:http/http.dart';

class SubscribeModel {
  void subscribeGithub(String value) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    await post(url, headers: header, body: body);
  }

  void unsubscribeGithub() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeCodebase(String value) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    await post(url, headers: header, body: body);
  }

  void unsubscribeCodebase() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeGitlab(String value) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    await post(url, headers: header, body: body);
  }

  void unsubscribeGitlab() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeDiscord(String value) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    await post(url, headers: header, body: body);
  }

  void unsubscribeDiscord() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeGoogle() async {
    final url = Uri.parse('$urlPrefix/services/google/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void unsubscribeGoogle() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeTwitter(String appToken, String appSecret, String userToken,
      String userSecret) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {
      "appKey": appToken,
      "appSecret": appSecret,
      "accessSecret": userSecret,
      "accessToken": userToken
    };
    await post(url, headers: header, body: body);
  }

  void unsubscribeTwitter() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};

    await delete(url, headers: header);
  }
}
