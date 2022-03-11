library globals;

import 'package:flutter/material.dart';
import 'package:client/models/action_container.dart';

const urlPrefix = 'https://europe-west1-area-37a17.cloudfunctions.net/api';
String globalToken = "";
ActionContainer globalContainer = ActionContainer();
bool setuped = false;

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
