import 'package:client/models/setup_model.dart';
import 'package:client/models/globals.dart';

class SetupController {
  static void setupArea(String tokenJWT) {
    setuped = true;
    globalToken = tokenJWT;
    SetupModel().getServices();
    SetupModel().getActions();
  }
}
