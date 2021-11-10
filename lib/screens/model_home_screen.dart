import 'package:flutter/material.dart';
import 'package:nir/screens/model_details_screen.dart';
import 'package:nir/screens/model_preview_screen.dart';

class ModelHomeScreen extends StatefulWidget {
  const ModelHomeScreen({Key? key}) : super(key: key);

  @override
  State<ModelHomeScreen> createState() => _ModelHomeScreenState();
}

class _ModelHomeScreenState extends State<ModelHomeScreen> {
  int _selectedTab = 0;
  bool play = true;
  static List<Widget> pages = <Widget>[
    ModelPreviewScreen(),
    ModelDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Model'),
      ),
      floatingActionButton: FloatingActionButton(
        child: playButton(),
        onPressed: _onPlayTapped,
      ),
      // body: IndexedStack(
      //   index: _selectedTab,
      //   children: ModelHomeScreen.pages,
      // ),
      body: pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedTab,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Preview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Details',
          ),
        ],
      ),
    );
  }

  Widget playButton() {
    if (play) {
      return const Icon(Icons.play_arrow);
    } else {
      return const Icon(Icons.pause);
    }
  }

  void _onPlayTapped() {
    setState(() {
      play = !play;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
