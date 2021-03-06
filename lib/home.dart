import 'package:flutter/material.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/screens/model_home_screen.dart';
import 'package:nir/screens/model_settings_screen.dart';
import 'package:provider/provider.dart';
import '../model/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Model();
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ModelHomeScreen(
                      manager: manager,
                      onCreate: (model) {
                        manager.updateModel(model);
                      },
                    ),
                  ),
                );
              },
              child: const Text('Start'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ModelSettingScreen()));
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
