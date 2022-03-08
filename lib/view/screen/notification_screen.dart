import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_navigation_screen.dart';

// ignore: must_be_immutable
class NotificationScreen extends KFDrawerContent {
  final bool dataPass;

  NotificationScreen({Key key, this.dataPass = false});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  
  var notificationValue = [false, false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            children: [
              SizedBox(height: KSize.geHeight(context, 60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      context.nextReplacementPage(BottomNavigationScreen());
                      appValueNotifier.showBottomNavBar();
                    },
                    child: widget.dataPass
                        ? Image.asset(
                            'assets/images/arrowLeft.png',
                            height: KSize.geHeight(context, 21),
                            width: KSize.getWidth(context, 11),
                            fit: BoxFit.fill,
                          )
                        : Container(),
                  ),
                  Spacer(),
                  Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('Notification', style: KTextStyle.headline8)),
                  Spacer()
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 40)),

              /// First switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Post', style: KTextStyle.headline8),
                      Text('If any new post update',
                          style: KTextStyle.overLine),
                    ],
                  ),
                  FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[0],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[0] = !notificationValue[0];
                      });
                    },
                  ),
                  // AdvancedSwitch(
                  //   controller: _controller,
                  //   activeColor: KColor.primary,
                  //   inactiveColor: KColor.mercury,
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  //   width: KSize.getWidth(context, 35),
                  //   height: KSize.geHeight(context, 25),
                  //   enabled: true,
                  //   // disabledOpacity:1,
                  // ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Second Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Got Hired', style: KTextStyle.headline8),
                      Text('If you get hired any company',
                          style: KTextStyle.overLine),
                    ],
                  ),
                  FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[1],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[1] = !notificationValue[1];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Third Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Get Rejected', style: KTextStyle.headline8),
                      Text('If you rejected by any company',
                          style: KTextStyle.overLine),
                    ],
                  ),
                   FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[2],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[2] = !notificationValue[2];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Fourth Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Message', style: KTextStyle.headline8),
                      Text('Got any new message', style: KTextStyle.overLine),
                    ],
                  ),
                   FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[3],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[3] = !notificationValue[3];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Fifth Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Call', style: KTextStyle.headline8),
                      Text('Have a call', style: KTextStyle.overLine),
                    ],
                  ),
                   FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[4],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[4] = !notificationValue[4];
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Sixth Switch
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dark Mode', style: KTextStyle.headline8),
                      Text('Enable dark theme', style: KTextStyle.overLine),
                    ],
                  ),
                   FlutterSwitch(
                    width: KSize.getWidth(context, 40),
                    height: KSize.geHeight(context, 25),
                    valueFontSize: KSize.geHeight(context, 10),
                    activeColor: KColor.primary,
                    inactiveColor: KColor.mercury,
                    toggleSize: KSize.geHeight(context, 24),
                    value: notificationValue[5],
                    borderRadius: KSize.geHeight(context, 30),
                    padding: KSize.geHeight(context, 2),
                    
                    onToggle: (val) {
                      setState(() {
                        notificationValue[5] = !notificationValue[5];
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
    appValueNotifier.showBottomNavBar();
  }
}
