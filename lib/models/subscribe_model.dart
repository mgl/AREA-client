import 'package:client/models/globals.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class SubscribeModel {
  void subscribeGithub(String value) async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeGithub() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void subscribeCodebase(String value) async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeCodebase() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void subscribeGitlab(String value) async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeGitlab() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void subscribeDiscord(String value) async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    final body = {"token": value};
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeDiscord() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void subscribeGoogle() async {
    final url = Uri.parse('$urlPrefix/services/google/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await post(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeGoogle() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
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
    var response = await post(url, headers: header, body: body);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }

  void unsubscribeTwitter() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    var response = await delete(url, headers: header);
    final SnackBar snackBar = SnackBar(content: Text(response.toString()));
    snackbarKey.currentState?.showSnackBar(snackBar);
  }
}
