import 'package:application/view/screen/login_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: Transform.translate(
          offset: Offset(-15, 0),
          child: Padding(
            padding: EdgeInsets.only(
                left: KSize.getWidth(context, 20),
                top: KSize.geHeight(context, 20)),
            child: Image.asset('assets/images/logo.png',
                height: KSize.geHeight(context, 25.82),
                width: KSize.getWidth(context, 23),
                scale: 4.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: KColor.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              'assets/images/vector.png',
              height: KSize.geHeight(context, 378),
              width: KSize.getWidth(context, 472),
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: KSize.geHeight(context, 62),
            ),
            Text('Find a Perfect', style: KTextStyle.headline2),
            Text('Job Match',
                style: KTextStyle.headline2.copyWith(height: 1.2)),
            SizedBox(
              height: KSize.geHeight(context, 5),
            ),
            Text('Finding your dream job is more easier',
                style: KTextStyle.subTitle1.copyWith(height: 1.8)),
            Text('and faster with JobHub',
                style: KTextStyle.subTitle1.copyWith(height: 1.8)),
            SizedBox(height: KSize.geHeight(context, 40)),
            Container(
                height: KSize.geHeight(context, 54),
                width: context.screenWidth,
                margin: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 57)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: KColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),
                  onPressed: () {
                    context.nextPage(LogInScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Let\'s Get Started',
                        style:
                            KTextStyle.subTitle1.copyWith(color: KColor.white),
                      ),
                      Image.asset('assets/images/arrow.png',
                          height: KSize.geHeight(context, 20),
                          width: KSize.getWidth(context, 20))
                    ],
                  ),
                )),
            SizedBox(height: KSize.geHeight(context, 67)),
          ],
        ),
      ),
    );
  }
}
