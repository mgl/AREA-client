import 'package:clt/models/setup_model.dart';
import 'package:clt/views/home/home.dart';

class SetupController {
  static void setupArea(
    String tokenJWT,
    God god,
  ) {
    if (tokenJWT == "") return;
    god.setuped = true;
    god.globalToken = tokenJWT;
    SetupModel().getServices(god);
    SetupModel().getActions(god);
  }
}
