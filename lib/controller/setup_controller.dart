import 'package:client/models/setup_model.dart';
import 'package:client/views/home/home.dart';

class SetupController {
  static void setupArea(String tokenJWT, God god, String globalToken,) {
    god.setuped = true;
    globalToken = tokenJWT;
    SetupModel().getServices(globalToken, god);
    SetupModel().getActions(globalToken, god);
  }
}
