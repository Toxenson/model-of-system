import 'package:flutter/material.dart';
import 'package:nir/model/model.dart';

class ModelManager extends ChangeNotifier {
  Model? _model = Model();
  bool _play = true;

  setModel(Model model) => _model = model;
  Model get model => _model!;
  bool get play => _play;

  void updateModel(Model model) {
    _model = null;
    _model = model;
    notifyListeners();
  }

  void pauseModel() {
    _play = !_play;
    model.isPlayed = _play;
    notifyListeners();
  }
}
