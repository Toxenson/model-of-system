import 'package:flutter/material.dart';
import 'package:nir/model/model.dart';

class ModelManager extends ChangeNotifier {
  ModelKnr _model = ModelKnr();
  bool _play = true;

  setModel(ModelKnr model) => _model = model;
  ModelKnr get model => _model;
  bool get play => _play;

  void updateModel(ModelKnr model) {
    _model = model;
    notifyListeners();
  }

  void playPauseModel() {
    _play = !_play;
    if (_play) {
      _model.runModel();
    }
    notifyListeners();
  }

  void playModel() {
    _play = true;
    notifyListeners();
  }

  void pauseModel() {
    _play = false;
    notifyListeners();
  }

  void restartModel() {
    _model.restartModel();
    notifyListeners();
  }
}
