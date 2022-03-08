import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/screen/message_screen.dart';
import 'package:application/view/screen/notification_screen.dart';
import 'package:application/view/screen/profile_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';

import 'drawer_screen.dart';

// ignore: must_be_immutable
class BottomNavigationScreen extends KFDrawerContent {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _selectedItemIndex = 0;

  int _currentIndex = 0;

  final List<Widget> _bottomNavPages = [
    //HomeScreen(),
    DrawerScreen(),
    MessageScreen(dataPass: false),
    ProfileScreen(dataPass: false),
    NotificationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomNavPages[_currentIndex],
      extendBody: true,
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: appValueNotifier.navBarStateNotifier,
          builder: (context, value, child) {
            return Container(
              height: value ? 0 : KSize.geHeight(context, 70),
              child: Stack(
                children: [
                  Container(
                      height: KSize.geHeight(context, 70),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: KColor.shade.withOpacity(0.5),
                                blurRadius: 20.00,
                                offset: Offset(-2, -2))
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)))),
                  Row(
                    children: [
                      buildNavBarItem(
                          'assets/images/home.png', 0, false, 'Home'),
                      buildNavBarItem(
                          'assets/images/chat.png', 1, false, 'Message'),
                      buildNavBarItem(
                          'assets/images/profileNav.png', 2, false, 'Profile'),
                      buildNavBarItem(
                          'assets/images/settingsNav.png', 3, false, 'Setting'),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget buildNavBarItem(String image, int index, bool isActive, String text) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
          _currentIndex = index;
        });
      },
      child: Container(
        height: KSize.geHeight(context, 80),
        width: MediaQuery.of(context).size.width / 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(
                    top: KSize.geHeight(context, 20),
                    bottom: KSize.geHeight(context, 5)),
                child: Image.asset(image,
                    height: KSize.geHeight(context, 20),
                    width: KSize.getWidth(context, 19),
                    fit: BoxFit.contain,
                    color: _selectedItemIndex == index
                        ? KColor.primary
                        : KColor.grey),
              ),
              if (_selectedItemIndex == index)
                Container(
                  child: Image.asset('assets/images/vectorr.png',
                      height: KSize.geHeight(context, 13),
                      width: KSize.getWidth(context, 16),
                      fit: BoxFit.contain),
                ),
              if (_selectedItemIndex != index)
                Text(text,
                    style: KTextStyle.caption
                        .copyWith(height: 1, color: KColor.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
