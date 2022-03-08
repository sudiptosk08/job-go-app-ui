import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/global_widgets/k_textfield.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/screen/bottom_navigation_screen.dart';
import 'package:application/view/screen/signup_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.geHeight(context, 100)),
              Padding(
                padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                child: Text(
                  'Welcome Back!',
                  style: KTextStyle.headline3,
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                child: Text('Fill your details or continue',
                    style: KTextStyle.subTitle1.copyWith(height: 1.8)),
              ),
              Padding(
                padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                child: Text('with social media',
                    style: KTextStyle.subTitle1.copyWith(height: 1.5)),
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              /// Email TextField
              KTextField(
                image: 'assets/images/msg.png',
                hintText: 'Email Address',
              ),
              SizedBox(height: KSize.geHeight(context, 24)),

              /// Password TextField
              KTextField(
                  image: 'assets/images/lock1.png',
                  isPasswordField: true,
                  hintText: 'Password'),
              SizedBox(height: KSize.geHeight(context, 10)),
              Align(
                  alignment: Alignment.topRight,
                  child: Text('Forget Password?', style: KTextStyle.caption)),
              SizedBox(height: KSize.geHeight(context, 40)),
              KButton(
                buttonText: 'LOG IN',
                onPressed: () {
                  context.nextReplacementPage(BottomNavigationScreen());
                  appValueNotifier.showBottomNavBar();
                },
              ),
              SizedBox(height: KSize.geHeight(context, 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/line.png',
                    height: KSize.geHeight(context, 2),
                    width: KSize.getWidth(context, 20),
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: KSize.getWidth(context, 10)),
                  Text('Or Continue With'),
                  SizedBox(width: KSize.getWidth(context, 10)),
                  Image.asset(
                    'assets/images/line.png',
                    height: KSize.geHeight(context, 2),
                    width: KSize.getWidth(context, 20),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/google.png',
                    height: KSize.geHeight(context, 60),
                    width: KSize.getWidth(context, 60),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: KSize.getWidth(context, 20)),
                  Image.asset(
                    'assets/images/facebook.png',
                    height: KSize.geHeight(context, 60),
                    width: KSize.getWidth(context, 60),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.nextPage(SignUpScreen()),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'New User?',
                        style: KTextStyle.bodyText
                            .copyWith(color: KColor.tertiary)),
                    TextSpan(
                        text: ' Create Account',
                        style: KTextStyle.headline8.copyWith(fontSize: 16)),
                  ])),
                ),
              ),
              SizedBox(height: KSize.geHeight(context, 78)),
            ],
          ),
        ),
      ),
    );
  }
}
