import 'package:flutter/cupertino.dart';

class DashProvider with ChangeNotifier {
  int stepIndex = 0;

  void changeStep(i) {
    stepIndex = i;
    notifyListeners();
  }
}
