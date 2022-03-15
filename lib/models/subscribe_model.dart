import 'package:client/models/globals.dart';
import 'package:client/models/service.dart';
import 'package:http/http.dart';
import 'package:client/views/home/home.dart';

class SubscribeModel {
  void subscribeGithub(String value, God god) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "github", token: value));
  }
    void subscribeCodebase(
      String apiKey, String userName, God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "apiKey": apiKey,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "codebase", token: ""));
  }


  void subscribeGitlab(String value, God god) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "gitlab", token: value));
  }

  void subscribeDiscord(God god) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    post(url, headers: header);
    god.globalContainer.service.add(Service(name: "discord", token: ""));
  }


  Future subscribeGoogle(
      String userName, String appPassword, God god) async {
    final url = Uri.parse('$urlPrefix/services/google/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "google", token: ""));
  }

  void subscribeTwitter(String bearerToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "bearerToken": bearerToken,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "twitter", token: bearerToken));
  }
}
