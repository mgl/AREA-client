import 'package:client/models/globals.dart';
import 'package:http/http.dart';

class SubscribeModel {
  void subscribeGithub() async {
    final url = Uri.parse('$urlPrefix/services/github/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void unsubscribeGithub() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeCodebase() async {
    final url = Uri.parse('$urlPrefix/services/codebase/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void unsubscribeCodebase() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeGitlab() async {
    final url = Uri.parse('$urlPrefix/services/gitlab/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void unsubscribeGitlab() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }

  void subscribeDiscord() async {
    final url = Uri.parse('$urlPrefix/services/discord/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
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

  void subscribeTwitter() async {
    final url = Uri.parse('$urlPrefix/services/twitter/subscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await post(url, headers: header);
  }

  void unsubscribeTwitter() async {
    final url = Uri.parse('$urlPrefix/services/twitter/unsubscribe');
    final header = {"Authorization": "Bearer " + globalToken};
    await delete(url, headers: header);
  }
}
