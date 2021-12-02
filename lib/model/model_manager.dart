import 'package:flutter/material.dart';
import 'package:nir/model/model_knr.dart';
import 'package:nir/model/model_kzo.dart';

class ModelManager extends ChangeNotifier {
  ModelKnr _modelKnr = ModelKnr();
  ModelKzo _modelKzo = ModelKzo();
  bool _play = true;

  setModel(ModelKnr modelKnr, ModelKzo modelKzo) {
    _modelKnr = modelKnr;
    _modelKzo = modelKzo;
  }

  ModelKnr get modelKnr => _modelKnr;
  ModelKzo get modelKzo => _modelKzo;
  bool get play => _play;

  void updateModel(ModelKnr modelKnr, ModelKzo modelKzo) {
    _modelKnr = modelKnr;
    _modelKzo = modelKzo;
    notifyListeners();
  }

  void playPauseModel() {
    _play = !_play;
    if (_play) {
      _modelKnr.runModel();
      _modelKzo.runModel();
    }
    notifyListeners();
  }

  void playModel() {
    _play = true;
    _modelKnr.runModel();
    _modelKzo.runModel();
    notifyListeners();
  }

  void pauseModel() {
    _play = false;
    notifyListeners();
  }

  void restartModel() {
    _modelKnr.restartModel();
    _modelKzo.restartModel();
    notifyListeners();
  }
}
