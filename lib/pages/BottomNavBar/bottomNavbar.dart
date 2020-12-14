import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:twitter/pages/HomePage/homePage.dart';
import 'package:twitter/pages/NotificationPage/notificationPage.dart';
import 'package:twitter/pages/ProfilePage/profilepage.dart';
import 'package:twitter/pages/Searchpage/searchpage.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  List<Widget> pages = [
    HomePage(),
    NotificationPage(),
    SearchPage(),
    ProfilePage()
  ];
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: selectedPage,
        onTap: _choixdePage,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.notification_important),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  void _choixdePage(int index) {
    print(index);
    setState(() {
      selectedPage = index;
    });
  }
}
