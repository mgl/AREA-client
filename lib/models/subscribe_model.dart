import 'package:client/models/globals.dart';
import 'package:client/models/service.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:client/views/home/home.dart';


class SubscribeModel {
  void subscribeGithub(String value, String globalToken,
     God god) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "github", token: value));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeGithub: " +
            response.statusCode.toString() +
            'bool = ' +
            god.connectedToGithub.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
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

  void subscribeCodebase(String value, String globalToken,
      God god) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "codebase", token: value));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeCodebase: " +
            response.statusCode.toString() +
            'bool = ' +
            god.connectedToCodebase.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
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

  void subscribeGitlab(String value, String globalToken,
      God god) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "gitlab", token: value));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeGitlab: " +
            response.statusCode.toString() +
            'bool = ' +
            god.connectedToGitlab.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
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

  void subscribeDiscord(String value, String globalToken,
      God god) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "discord", token: value));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeDiscord: " +
            response.statusCode.toString() +
            'bool = ' +
            god.connectedToDiscord.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
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
      String globalToken, God god) async {
    final url = Uri.parse('$urlPrefix/services/google/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await post(url, headers: header);
    god.globalContainer.service.add(Service(name: "google", token: ""));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeGoogle: " + response.statusCode.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  // Future unsubscribeGoogle(String globalToken) async {
  //   final url = Uri.parse('$urlPrefix/services/google/unsubscribe');
  //   final header = {"Authorization": "Bearer " + globalToken};
  //   var response = await delete(url, headers: header);
  //   final SnackBar snackBar = SnackBar(
  //       content: Text("unsubscribeGoogle: " + response.statusCode.toString()));
  //   snackbarKey.currentState?.showSnackBar(snackBar);
  // }

  void subscribeTwitter(
      String appToken,
      String appSecret,
      String userToken,
      String userSecret,
      String globalToken,
      God god) async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {
      "appKey": appToken,
      "appSecret": appSecret,
      "accessSecret": userSecret,
      "accessToken": userToken
    };
    var response = await post(url, headers: header, body: body);
    god.globalContainer.service.add(Service(name: "twitter", token: ""));
    final SnackBar snackBar = SnackBar(
        content: Text("subscribeTwitter: " +
            response.statusCode.toString() +
            'bool = ' +
            god.connectedToTwitter.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  // void unsubscribeTwitter(String globalToken, bool connectedToTwitter) async {
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
