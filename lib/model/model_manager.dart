import 'package:flutter/material.dart';
import 'package:nir/model/model.dart';

class ModelManager extends ChangeNotifier {
  var _model = Model();
  bool _play = true;

  setModel(Model model) => _model = model;
  Model get model => _model;
  bool get play => _play;

  void updateModel(Model model) {
    _model = model;
    notifyListeners();
  }

  void pauseModel() {
    _play = !_play;
    notifyListeners();
  }
}
