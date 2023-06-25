import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical5/constants/string_constant.dart';
import 'package:practical5/screens/fav_page.dart';
import 'package:practical5/screens/inc.dart';
import 'package:practical5/screens/settings.dart';
import 'package:practical5/screens/store.dart';

import 'landing_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = [LandingPage(), StorePage(), FavPage(), SettingPage(), Inc(numbers: 0,)];
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black87,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill), label: "${StringConstants.home}"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart_fill), label: "${StringConstants.store}"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star_fill), label: "${StringConstants.favourites}"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "${StringConstants.settings}"),
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
