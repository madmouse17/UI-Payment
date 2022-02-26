import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:ui_payment/constant.dart';
import 'package:ui_payment/payment.dart';

class bottomMenu extends StatefulWidget {
  const bottomMenu({Key? key}) : super(key: key);

  @override
  _bottomMenuState createState() => _bottomMenuState();
}

class _bottomMenuState extends State<bottomMenu> {
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const payment(),
      const payment(),
      const payment(),
      const payment(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/Home.png"),
        activeColorPrimary: colorprimary,
        inactiveColorPrimary: colorprimary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/Wallet.png"),
        activeColorPrimary: colorprimary,
        inactiveColorPrimary: colorprimary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/Activity.png"),
        activeColorPrimary: colorprimary,
        inactiveColorPrimary: colorprimary,
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/Profile.png"),
        activeColorPrimary: colorprimary,
        inactiveColorPrimary: colorprimary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor:
            Color.fromARGB(255, 43, 40, 53), // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }
}
