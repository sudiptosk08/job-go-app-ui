import 'dart:async';

import 'package:flutter/material.dart';

class BottomNavBarVisibilityNotifier {
  ValueNotifier navBarStateNotifier = ValueNotifier(false);

  void hideBottomNavBar() {
    navBarStateNotifier.value = true;
  }

  void showBottomNavBar() {
    Timer(new Duration(seconds: 0), () {
      navBarStateNotifier.value = false;
    });
  }
}

BottomNavBarVisibilityNotifier appValueNotifier =
    BottomNavBarVisibilityNotifier();
