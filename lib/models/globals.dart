library globals;

import '';
import 'package:flutter/material.dart';
import 'package:client/models/action_container.dart';

//const urlPrefix = 'https://europe-west1-area-37a17.cloudfunctions.net/api';
const urlPrefix = 'http://localhost:5000/area-37a17/europe-west1/api';

String globalToken = "";
ActionContainer globalContainer = ActionContainer();
bool setuped = false;



bool connectedToGitlab = false;
bool connectedToGithub = false;
bool connectedToCodebase = false;
bool connectedToDiscord = false;
bool connectedToGoogle = false;
bool connectedToTwitter = false;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
