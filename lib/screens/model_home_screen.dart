import 'package:flutter/material.dart';
import 'package:nir/model/model.dart';
import 'package:nir/model/model_manager.dart';
import 'package:nir/screens/model_details_screen.dart';
import 'package:nir/screens/model_preview_screen.dart';

class ModelHomeScreen extends StatefulWidget {
  const ModelHomeScreen({
    Key? key,
    required this.onCreate,
    required this.manager,
  }) : super(key: key);

  final Function(Model) onCreate;
  final ModelManager manager;

  @override
  State<ModelHomeScreen> createState() => _ModelHomeScreenState();
}

class _ModelHomeScreenState extends State<ModelHomeScreen> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      ModelPreviewScreen(
        manager: widget.manager,
      ),
      ModelDetailsScreen(),
    ];
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Model'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPlayTapped,
          child: playButton(),
        ),
        // body: IndexedStack(
        //   index: _selectedTab,
        //   children: ModelHomeScreen.pages,
        // ),
        body: pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
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
      ),
    );
  }

  Widget playButton() {
    if (!widget.manager.play) {
      return const Icon(Icons.play_arrow);
    } else {
      return const Icon(Icons.pause);
    }
  }

  void _onPlayTapped() {
    widget.manager.playPauseModel();
    setState(() {});
  }

  Future<bool> _onBackPressed() {
    widget.manager.pauseModel();
    Navigator.of(context).pop(true);
    var a = Future<bool>(() => true);
    return a;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }
}
