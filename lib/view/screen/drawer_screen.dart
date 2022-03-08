import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/route/route_class_builder.dart';
import 'package:application/view/screen/applications_screen.dart';
import 'package:application/view/screen/notification_screen.dart';
import 'package:application/view/screen/profile_screen.dart';
import 'package:application/view/screen/splash_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DrawerScreen extends StatefulWidget {
  final String title;

  const DrawerScreen({Key key, this.title}) : super(key: key);

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _drawerController = KFDrawerController(
          initialPage:RouteClassBuilder.fromString('HomeScreen'),
          items: [
            KFDrawerItem.initWithPage(
              onPressedForNextPage: () {
                context.nextReplacementPage(ProfileScreen(dataPass: true,));
              },
              text: Text('Edit Profile',
                  style:
                      KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
              icon: Container(
                height: KSize.geHeight(context, 36),
                width: KSize.getWidth(context, 36),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/userIcon.png'))),
              ),
              page: RouteClassBuilder.fromString('ProfileScreen'),
            ),
            KFDrawerItem.initWithPage(
              onPressedForNextPage: () {
                context.nextReplacementPage(ApplicationScreen());
              },
              text: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Applications ',
                    style:
                        KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
                TextSpan(text: ' (8)', style: KTextStyle.subTitle1),
              ])),
              icon: Container(
                height: KSize.geHeight(context, 36),
                width: KSize.getWidth(context, 36),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/history.png'))),
              ),
              page: RouteClassBuilder.fromString('ApplicationScreen'),
            ),
            KFDrawerItem.initWithPage(
              onPressedForNextPage: () {
                context.nextReplacementPage(NotificationScreen(dataPass: true,));
              },
                text: Text('Notifications Settings',
                    style:
                        KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
                icon: Container(
                  height: KSize.geHeight(context, 36),
                  width: KSize.getWidth(context, 36),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/settings.png'))),
                ),
                page: RouteClassBuilder.fromString('NotificationScreen')),
            KFDrawerItem.initWithPage(
              text: Text('Share App',
                  style:
                      KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
              icon: Container(
                height: KSize.geHeight(context, 36),
                width: KSize.getWidth(context, 36),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/heart.png'))),
              ),
            ),
          ],
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
          controller: _drawerController,
          header: KFDrawerItem(
              text: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset('assets/images/profile.png',
                      alignment: Alignment.centerLeft,
                      height: KSize.geHeight(context, 80),
                      width: KSize.getWidth(context, 80),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: KSize.geHeight(context, 10)),
              Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text('Adom Shafi', style: KTextStyle.headline4)),
              
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child:
                    Text('hellobesnik@gmail.com', style: KTextStyle.bodyText2),
              ),
            ],
          )),
          footer: KFDrawerItem(
            text: Row(
              children: [
                Image.asset('assets/images/logout.png',
                    fit: BoxFit.contain,

                    height: KSize.geHeight(context, 36),
                    width: KSize.getWidth(context, 36)),
                SizedBox(width: KSize.getWidth(context, 7)),
                Text('Log Out',
                    style:
                        KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
              ],
            ),
            onPressedForNextPage: () {
              context.nextAndRemoveUntilPage(SplashScreen());
            },
          ),
          decoration: BoxDecoration(color: KColor.white)),
    );
  }
}
