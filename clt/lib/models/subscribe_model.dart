import 'package:clt/models/globals.dart';
import 'package:clt/models/service.dart';
import 'package:http/http.dart';
import 'package:clt/views/home/home.dart';
import 'package:uuid/uuid.dart';

class SubscribeModel {
  void subscribeGithub(String value, God god) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "github", token: value));
  }

  void subscribeCodebase(String apiKey, String userName, God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "token": apiKey,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "Codebase", token: apiKey));
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
    post(url, headers: header, body: {'token': const Uuid().v4()});
    god.globalContainer.service
        .add(Service(name: "discord", token: const Uuid().v4()));
  }

  Future subscribeMail(String userName, String appPassword, God god) async {
    final url = Uri.parse('$urlPrefix/services/mail/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "username": userName,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "mail", token: const Uuid().v4()));
  }

  void subscribeTwitter(String accessToken, String accessPassword,
      String appKeyToken, String appPassword, God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + god.globalToken};
    final body = {
      "accessToken": accessToken,
      "accessPassword": accessPassword,
      "appKeyToken": appKeyToken,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "twitter", token: accessToken));
  }
}
