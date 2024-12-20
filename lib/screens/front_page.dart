import 'package:fitnessapp/screens/breakfast_page.dart';
import 'package:fitnessapp/screens/home.dart';
import 'package:fitnessapp/screens/login_signup/edit_personalInfo.dart';
import 'package:fitnessapp/screens/manage_profle.dart';
import 'package:fitnessapp/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int selectedIndex = 0;

  void _handleSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      Home(),
      BreakFast(),
      Profile(),
      ManageProfile(),
      // EditPersonalinfo(),
      // Profile(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: "Home",
          inactiveColorPrimary: Colors.grey.shade600,
          activeColorPrimary: Colors.purple),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.menu_book_sharp),
          title: "Dashboard",
          inactiveColorPrimary: Colors.grey.shade600,
          activeColorPrimary: Colors.purple),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          inactiveColorPrimary: Colors.grey,
          title: "Home",
          activeColorPrimary: Colors.purple),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.more_horiz),
          title: "Home",
          inactiveColorPrimary: Colors.grey.shade600,
          activeColorPrimary: Colors.purple),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: const Color.fromARGB(255, 184, 216, 201), context,
      screens: _buildScreens(),
      controller: _controller,
      items: _navBarItems(),
      confineToSafeArea: true,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(borderRadius: BorderRadius.circular(0.5)),
      navBarStyle: NavBarStyle.simple,

      // stores the current index of navbaritems
      onItemSelected: (int selectedIndex) {
        _handleSelectedIndex(selectedIndex);
      },
    );
  }
}
