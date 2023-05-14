import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical5/screens/fav_page.dart';
import 'package:practical5/screens/settings.dart';
import 'package:practical5/screens/store.dart';

import 'landing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List pages = [LandingPage(), StorePage(), FavPage(), SettingPage()];
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart_fill), label: "Store"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star_fill), label: "Favourite"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
