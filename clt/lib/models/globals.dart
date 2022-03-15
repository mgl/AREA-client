library globals;

import 'package:flutter/material.dart';

const urlPrefix = String.fromEnvironment("SERVER_API_URL");
// const urlPrefix = 'http://localhost:5000/area-37a17/europe-west1/api';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();
