import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/global_widgets/k_textfield.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/screen/bottom_navigation_screen.dart';
import 'package:application/view/screen/login_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Transform.translate(
              offset: Offset(-15, 0),
              child: Padding(
                padding: EdgeInsets.only(
                    left: KSize.getWidth(context, 30),
                    top: KSize.geHeight(context, 25)),
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/arrowLeft.png',
                      height: KSize.geHeight(context, 21),
                width: KSize.getWidth(context, 11),
                fit: BoxFit.fill,)
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: KSize.geHeight(context, 39)),
              Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                  child: Text('Register Account',  style: KTextStyle.headline4.copyWith( fontWeight: FontWeight.w600))),
              
              Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                  child: Text('Fill your details or continue',
                      style: KTextStyle.subTitle1.copyWith(height: 1.8))),
              Padding(
                  padding: EdgeInsets.only(left: KSize.getWidth(context, 10)),
                  child: Text('with social media',
                      style: KTextStyle.subTitle1.copyWith(height: 1.8))),
              SizedBox(height: KSize.geHeight(context, 30)),

              ///User TextField
              KTextField(
                  image: 'assets/images/union.png', hintText: 'User Name'),
              SizedBox(height: KSize.geHeight(context, 24)),
              KTextField(
                  image: 'assets/images/msg.png', hintText: 'Email Address'),
              SizedBox(height: KSize.geHeight(context, 24)),
              KTextField(
                  image: 'assets/images/lock1.png',
                  isPasswordField: true,
                  hintText: 'Password'),
              SizedBox(height: KSize.geHeight(context, 40)),

              /// Sign Up Button
              KButton(
                buttonText: 'SIGN UP',
                onPressed: () {
                  context.nextReplacementPage(BottomNavigationScreen());
                  appValueNotifier.showBottomNavBar();
                },
              ),
              SizedBox(height: KSize.geHeight(context, 40)),

              ///Or Continue With

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/line.png',
                      height: KSize.geHeight(context, 2),
                      width: KSize.getWidth(context, 20),
                      fit: BoxFit.cover),
                  SizedBox(width: KSize.getWidth(context, 10)),
                  Text('Or Continue With'),
                  SizedBox(width: KSize.getWidth(context, 10)),
                  Image.asset('assets/images/line.png',
                      height: KSize.geHeight(context, 2),
                      width: KSize.getWidth(context, 20),
                      fit: BoxFit.cover),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              ///Google FaceBook
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/google.png',
                      height: KSize.geHeight(context, 60),
                      width: KSize.getWidth(context, 60),
                      fit: BoxFit.contain),
                  SizedBox(width: KSize.getWidth(context, 20)),
                  Image.asset('assets/images/facebook.png',
                      height: KSize.geHeight(context, 60),
                      width: KSize.getWidth(context, 60),
                      fit: BoxFit.contain),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),

              ///Already Have an account? logIn?
              Center(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.nextPage(LogInScreen()),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Already Have Account?',
                        style: KTextStyle.bodyText
                            .copyWith(color: KColor.tertiary)),
                    TextSpan(
                        text: ' Log In',
                        style: KTextStyle.headline8.copyWith(fontSize: 16)),
                  ])),
                ),
              ),

              /// Last Of Space
              SizedBox(height: KSize.geHeight(context, 78)),
            ],
          ),
        ),
      ),
    );
  }
}
