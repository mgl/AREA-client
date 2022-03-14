import 'package:client/models/globals.dart';
import 'package:client/models/service.dart';
import 'package:http/http.dart';
import 'package:client/views/home/home.dart';

class SubscribeModel {
  void subscribeGithub(String value, String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "github", token: value));
  }

  // void unsubscribeGithub(String globalToken, GlobalContainer globalContainer,
  //     bool connectedToGihtub) async {
  //   final url = Uri.parse('$urlPrefix/services/github/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeGithub: " +
  //           response.statusCode.toString() +
  //           'bool = ' +
  //           connectedToGihtub.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  void subscribeCodebase(
      String apiKey, String userName, String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {
      "username": userName,
      "apiKey": apiKey,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "codebase", token: ""));
  }

  // void unsubscribeCodebase(String globalToken, GlobalContainer globalContainer,
  //     bool connectedToCodebase) async {
  //   final url = Uri.parse('$urlPrefix/services/codebase/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeCodebase: " +
  //           response.statusCode.toString() +
  //           'bool = ' +
  //           connectedToCodebase.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  void subscribeGitlab(String value, String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "gitlab", token: value));
  }

  // void unsubscribeGitlab(String globalToken, God god) async {
  //   final url = Uri.parse('$urlPrefix/services/gitlab/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeGitlab: " +
  //           response.statusCode.toString() +
  //           'bool = ' +
  //           connectedToGitlab.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  void subscribeDiscord(String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    post(url, headers: header);
    god.globalContainer.service.add(Service(name: "discord", token: ""));
  }

  // void unsubscribeDiscord(String globalToken, bool connectedToDiscord) async {
  //   final url = Uri.parse('$urlPrefix/services/discord/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeDiscord: " +
  //           response.statusCode.toString() +
  //           'bool = ' +
  //           connectedToDiscord.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  Future subscribeGoogle(
      String userName, String appPassword, String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/google/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {
      "username": userName,
      "appPassword": appPassword,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "google", token: ""));
  }

  // Future unsubscribeGoogle(String globalToken) async {
  //   final url = Uri.parse('$urlPrefix/services/google/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeGoogle: " + response.statusCode.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  void subscribeTwitter(String bearerToken, String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {
      "bearerToken": bearerToken,
    };
    post(url, headers: header, body: body);
    god.globalContainer.service
        .add(Service(name: "twitter", token: bearerToken));
  }

  // void unsubscribeTwitter(String globalToken,  bool connectedToTwitter) async {
  //   final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeTwitter: " +
  //           response.statusCode.toString() +
  //           'bool = ' +
  //           connectedToTwitter.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }
}
