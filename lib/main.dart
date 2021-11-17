import 'package:flutter/material.dart';
import 'package:nir/model/model_manager.dart';
import 'package:provider/provider.dart';
import 'package:nir/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOTR Model',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ModelManager()),
        ],
        child: HomeScreen(),
      ),
    );
  }
}
