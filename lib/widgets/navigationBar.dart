import 'package:judoo/customIcons.dart';
import 'package:judoo/widgets/views/index.dart';
import 'package:flutter/material.dart';


class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomePage(key: PageStorageKey(HomePage.name)),
    ClubsPage(key: PageStorageKey(ClubsPage.name)),
    BeltsPage(key: PageStorageKey(BeltsPage.name)),
    GuidePage(key: PageStorageKey(GuidePage.name)),
  ];
  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _selectedIndex = index),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red[700],
        unselectedItemColor: Colors.blueGrey[800],
        selectedFontSize: 13.1,
        unselectedFontSize: 13,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: HomePage.icon,
              label: HomePage.name
          ),
          BottomNavigationBarItem(
              icon: ClubsPage.icon,
              label: ClubsPage.name
          ),
          BottomNavigationBarItem(
              icon: BeltsPage.icon,
              label: BeltsPage.name
          ),
          BottomNavigationBarItem(
              icon: GuidePage.icon,
              label: GuidePage.name
          ),
        ],
      ),
    );
  }
}