import 'package:flutter/material.dart';
import 'package:flutter_ebook/screens/cart/cart_page.dart';
import 'package:flutter_ebook/screens/home/home_page.dart';
import 'package:flutter_ebook/screens/save/save_page.dart';
import 'package:flutter_ebook/screens/user/user_page.dart';
import 'package:flutter_ebook/themes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final _screens=[
    HomePage(),
    SavePage(),
    CartPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (i) {
            //print(i);
            setState(() {
              _selectedIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-home.png',
                    width: 20,
                    color: _selectedIndex == 0 ? greenColor : greyColor,
                  ),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-save-nav.png',
                    width: 14,
                    color: _selectedIndex == 1 ? greenColor : greyColor,
                  ),
                ),
                label: 'Save'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-cart.png',
                    width: 20,
                    color: _selectedIndex == 2 ? greenColor : greyColor,
                  ),
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Image.asset(
                    'assets/icons/icon-user.png',
                    width: 18,
                    color: _selectedIndex == 3 ? greenColor : greyColor,
                  ),
                ),
                label: 'User'),
          ]);
    }

    return Scaffold(
      bottomNavigationBar: customBottomNav(),
      body: Stack(
        children: _screens.asMap().map((i, Screen) => MapEntry(i, Offstage
        (offstage: _selectedIndex!=i,
        child: Screen,)))
        .values
        .toList(),
      ),
    );
  }
}
