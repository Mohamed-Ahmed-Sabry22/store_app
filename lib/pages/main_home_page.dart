import 'package:_9_store_app/constants.dart';
import 'package:_9_store_app/pages/cart_page.dart';
import 'package:_9_store_app/pages/home_page.dart';
import 'package:_9_store_app/pages/profile_page.dart';
import 'package:advanced_salomon_bottom_bar/advanced_salomon_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});
  static String id = 'MainHomePage';

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int selectedIdx = 1;

  final List<Widget> screens = [CartPage(), HomePage(), ProfilePage()];

  void onTapped(int idx) {
    setState(() {
      selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(selectedIdx),
      bottomNavigationBar: AdvancedSalomonBottomBar(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: const Color.fromARGB(255, 129, 154, 167),
        itemPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        curve: Curves.decelerate,
        items: [
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            activeIcon: Icon(Icons.favorite),
          ),
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
            activeIcon: Icon(Icons.home),
          ),
          AdvancedSalomonBottomBarItem(
            icon: Icon(Icons.person_2_outlined),
            title: Text("Profile"),
            activeIcon: Icon(Icons.person),
          ),
        ],
        currentIndex: selectedIdx,
        onTap: onTapped,
      ),
    );
  }
}
