import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/screen/message_person_screen.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:velocity_x/velocity_x.dart';

import 'bottom_navigation_screen.dart';

// ignore: must_be_immutable
class MessageScreen extends KFDrawerContent {
  final bool dataPass;

  MessageScreen({Key key, this.dataPass = false});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<String> profilePicture = [
    'assets/images/avatar.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
    'assets/images/avatar7.png',
    'assets/images/avatar8.png',
    'assets/images/avatar9.png',
  ];

  final List<String> profileName = [
    'Rozanne Barrientes',
    'Anaya Sanji',
    'Elizabeth Olsen',
    'Tony Stark',
    'Banner',
    'Steave',
    'Thor',
    'Natasha',
    'Hak Eye'
  ];

  final List<String> messageList = [
    'A wonderful  serenity has taken...',
    'What about Paypal?',
    'We should move forward...',
    'Let\'s have a call for...',
    'I don\'t think i can fit on this ui...',
    'Move in some special work...',
    'You should be a avenger i think the...',
    'I am going to die in avengers..',
    'I have to save natasha...'
  ];

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
              /// Design for AppBar
              SizedBox(height: KSize.geHeight(context, 60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: 
                    widget.dataPass? 
                    Image.asset(
                            'assets/images/arrowLeft.png',
                            height: KSize.geHeight(context, 21),
                width: KSize.getWidth(context, 11),
                fit: BoxFit.fill,
                          )
                        : Container(),
                  ),
                  Text('Message', style: KTextStyle.headline8),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                  
                    child: Image.asset('assets/images/search.png',
                        fit: BoxFit.scaleDown,
                        height: KSize.geHeight(context, 24),
                        width: KSize.getWidth(context, 24)),
                  ),
                ],
              ),

              /// Spacing
              SizedBox(height: KSize.geHeight(context, 20)),

              /// Chat List
              Expanded(
                child: ListView.builder(
                    itemCount: profilePicture.length,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.nextPage(MessagePersonScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              bottom: KSize.geHeight(context, 30)),
                          child: Slidable(
                            actionPane: SlidableStrechActionPane(),
                            
                            actionExtentRatio: KSize.getWidth(context, 0.10),
                            
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              height: KSize.geHeight(context, 50),
                              child: Row(
                                children: [
                                  Image.asset(profilePicture[index],
                                      fit: BoxFit.fitHeight,
                                      height: KSize.geHeight(context, 40),
                                      width: KSize.getWidth(context, 40)),
                                  SizedBox(width: KSize.getWidth(context, 15)),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(profileName[index],
                                          style: KTextStyle.headline8.copyWith(
                                              fontSize: 16, height: 1)),
                                      //Spacer(),
                                      SizedBox(height: 5,),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Text(messageList[index],
                                            style: KTextStyle.bodyText2
                                                .copyWith(height: 1)),
                                      )
                                    ],
                                  ),
                                  if (index == 0)
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                            'assets/images/notification1.png',
                                            fit: BoxFit.fitHeight,
                                            height: KSize.geHeight(context, 24),
                                            width: KSize.getWidth(context, 24)),
                                      ),
                                    ),
                                  if (index == 1)
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Image.asset(
                                            'assets/images/notification2.png',
                                            fit: BoxFit.fitHeight,
                                            height: KSize.geHeight(context, 24),
                                            width: KSize.getWidth(context, 24)),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            secondaryActions: <Widget>[
                              Image.asset(
                                'assets/images/delete.png',
                                width: KSize.getWidth(context, 60),
                                height: KSize.geHeight(context, 80),
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),

              SizedBox(
                  height:
                      kBottomNavigationBarHeight + KSize.geHeight(context, 10)),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: missing_return
  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}
