import 'package:client/models/setup_model.dart';


class SetupController {

  static void SetupArea() {
    SetupModel().getServices();
    SetupModel().getActions();
  }
}
