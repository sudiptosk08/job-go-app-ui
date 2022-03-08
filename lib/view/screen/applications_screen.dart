import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/model/application_model.dart';
import 'package:application/view/screen/bottom_navigation_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ApplicationScreen extends KFDrawerContent {
  ApplicationScreen({Key key});

  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left:KSize.getWidth(context, 20),right:  KSize.getWidth(context, 10)),
          
         // EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Image.asset(
                      'assets/images/arrowLeft.png',
                      height: KSize.geHeight(context, 21),
                width: KSize.getWidth(context, 11),
                fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                  Transform.translate(
                      offset: Offset(-15, 0),
                      child: Text('Applications', style: KTextStyle.headline8)),
                  Spacer()
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 40)),
              Text('Your Applications',
                  style:
                      KTextStyle.headline6.copyWith(color: KColor.secondary)),
              //SizedBox(height: KSize.geHeight(context, 20)),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: applicationList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: KColor.shade.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        margin: EdgeInsets.only(
                          bottom: KSize.geHeight(context, 20),
                          right: KSize.getWidth(context, 10)
                        ),
                        child: Container(
                          height: KSize.geHeight(context, 155),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                                boxShadow: [
                              BoxShadow(
                                color: KColor.grey.withOpacity(0.2),
                                offset: Offset(3,1),
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                              ),
                            ],),
                          child: Padding(
                            padding: EdgeInsets.only(
                                bottom: KSize.geHeight(context, 20),
                                left: KSize.getWidth(context, 20),
                                right: KSize.getWidth(context, 15),
                                top: KSize.geHeight(context, 22)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(applicationList[index].image,
                                        height: KSize.geHeight(context, 50),
                                        width: KSize.getWidth(context, 50),
                                        fit: BoxFit.contain),
                                    SizedBox(
                                        width: KSize.getWidth(context, 20)),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(applicationList[index].title,
                                            style: KTextStyle.caption
                                                .copyWith(height: 1)),
                                        SizedBox(
                                            height: KSize.geHeight(context, 5)),
                                        Text(applicationList[index].designation,
                                            style: KTextStyle.headline8
                                                .copyWith(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1)),
                                        SizedBox(
                                            height:
                                                KSize.geHeight(context, 10)),
                                        Text(applicationList[index].countryName,
                                            style: KTextStyle.caption
                                                .copyWith(height: 1)),
                                      ],
                                    ),
                                    Spacer(),
                                    Transform.translate(
                                        offset: Offset(0, -15),
                                        child: Icon(
                                          Icons.more_vert,
                                          color: KColor.secondary,
                                        ))
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: KSize.geHeight(context, 35),
                                      width: KSize.getWidth(context, 135),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: applicationList[index]
                                              .backgroundColor),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                KSize.getWidth(context, 20)),
                                        child: Text(
                                            applicationList[index].status,
                                            style: KTextStyle.bodyText.copyWith(
                                                color: applicationList[index]
                                                    .textColor)),
                                      ),
                                    ),
                                    Text(
                                      applicationList[index].price,
                                      style: KTextStyle.bodyText.copyWith(
                                          color:
                                              applicationList[index].textColor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
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
