import 'package:flutter/material.dart';

class ModelSettingScreen extends StatelessWidget {
  const ModelSettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
    );
  }
}
