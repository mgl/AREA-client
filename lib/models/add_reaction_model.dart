// import 'package:client/models/actions/action_github_issue.dart';
// import 'package:client/models/globals.dart';
// import 'package:http/http.dart';
// import 'dart:core';
// import 'package:uuid/uuid.dart';

// class AddReactionModel {
//   final String issueId;
//   final String reaction;
//   final String userId;
//   final String userName;
//   final String userAvatar;

//   AddReactionModel({
//     this.issueId,
//     this.reaction,
//     this.userId,
//     this.userName,
//     this.userAvatar,
//   });

//   factory AddReactionModel.fromJson(Map<String, dynamic> json) {
//     return AddReactionModel(
//       issueId: json['issueId'],
//       reaction: json['reaction'],
//       userId: json['userId'],
//       userName: json['userName'],
//       userAvatar: json['userAvatar'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'issueId': issueId,
//         'reaction': reaction,
//         'userId': userId,
//         'userName': userName,
//         'userAvatar': userAvatar,
//       };

//   Future<Response> addReaction() async {
//     var uuid = Uuid();
//     var id = uuid.v4();
//     var action = ActionGithubIssue(
//       id: id,
//       issueId: issueId,
//       userId: userId,
//       userName: userName,
//       userAvatar: userAvatar,
//       reaction: reaction,
//     );
//     var json = action.toJson();
//     var response = await post(
//       '${Globals.apiUrl}/actions/github-issue',
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode(json),
//     );
//     return response;
//   }
// }
