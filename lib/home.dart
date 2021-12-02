import 'package:flutter/material.dart';
import 'package:nir/model/model_kzo.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/screens/model_home_screen.dart';
import 'package:nir/screens/model_settings_screen.dart';
import 'package:provider/provider.dart';
import 'model/model_knr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                final manager =
                    Provider.of<ModelManager>(context, listen: false);
                final modelKnr = ModelKnr(manager: manager);
                final modelKzo = ModelKzo(manager: manager);
                manager.setModel(modelKnr, modelKzo);
                manager.restartModel();
                manager.playModel();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModelHomeScreen(
                      manager: manager,
                      onCreate: (model) {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
