import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/presentation/screens/mainpage.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  var _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const MainScreen(),
      const MainScreen(),
      const MainScreen(),
      const MainScreen(),
      const MainScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        title: "home",
        icon: const Icon(Icons.home_filled),
        activeColorPrimary: Color(AppColors.blue),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: "Messages",
        icon: const Icon(CupertinoIcons.chat_bubble_text),
        activeColorPrimary: Color(AppColors.blue),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: "To-dos",
        icon: const Icon(Icons.chat),
        activeColorPrimary: Color(AppColors.blue),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: "Notifications",
        icon: const Icon(Icons.notifications),
        activeColorPrimary: Color(AppColors.blue),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: "Profile",
        icon: const Icon(CupertinoIcons.profile_circled),
        activeColorPrimary: Color(AppColors.blue),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      // decoration: const NavBarDecoration(
      //   border: BoxBorder
      //   // boxShadow: <BoxShadow>[
      //   //   BoxShadow(
      //   //     color: Colors.black,
      //   //     blurRadius: 14,
      //   //     spreadRadius: 0,
      //   //   ),
      //   // ],
      //   // borderRadius: BorderRadius.only(
      //   //     topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      //   // colorBehindNavBar: Colors.white,
      // ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}