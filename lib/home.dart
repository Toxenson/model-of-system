import 'package:flutter/material.dart';
import 'package:nir/screens/model_home_screen.dart';
import 'package:nir/screens/model_settings_screen.dart';
import '../model/model.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ModelHomeScreen()));
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
