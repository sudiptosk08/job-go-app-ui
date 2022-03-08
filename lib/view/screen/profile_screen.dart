import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/screen/bottom_navigation_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class ProfileScreen extends KFDrawerContent {
  final bool dataPass;

  ProfileScreen({Key key, this.dataPass = false});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = 'Adom Shafi';
    emailController.text = 'hellobesnik@gmail.com';
    passwordController.text = '*************';
    
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
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
                      child: widget.dataPass
                          ? Image.asset(
                              'assets/images/arrowLeft.png',
                              height: KSize.geHeight(context, 21),
                              width: KSize.getWidth(context, 11),
                              fit: BoxFit.fitHeight,
                            )
                          : Container(),
                    ),
                    Spacer(),
                    Transform.translate(
                        offset: Offset(0, 0),
                        child: Text('Profile', style: KTextStyle.headline8)),
                    Spacer()
                  ],
                ),
                SizedBox(height: KSize.geHeight(context, 40)),

                /// Profile Image
                Center(
                  child: Image.asset(
                    'assets/images/editProfile.png',
                    height: KSize.geHeight(context, 80),
                    width: KSize.getWidth(context, 80),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: KSize.geHeight(context, 18)),

                /// Profile Name
                Center(child: Text('Adom Shafi', style: KTextStyle.headline4)),
                //  SizedBox(height: KSize.geHeight(context, 10)),

                /// Profile Edit
                Center(
                    child: Text('Edit Profile', style: KTextStyle.bodyText2)),
                SizedBox(height: KSize.geHeight(context, 40)),
                Text('Name', style: KTextStyle.subTitle1),
                SizedBox(height: KSize.geHeight(context, 10)),

                /// Name TextField
                Container(
                    height: KSize.geHeight(context, 52),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: KColor.lightGrayy),
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: KSize.geHeight(context, 20)),
                      child: TextField(
                        style: TextStyle(fontWeight: FontWeight.w500),
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Name',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                      ),
                    )),
                SizedBox(height: KSize.geHeight(context, 30)),
                Text('Your Email', style: KTextStyle.subTitle1),
                SizedBox(height: KSize.geHeight(context, 10)),

                /// Email TextField
                Container(
                    height: KSize.geHeight(context, 52),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: KColor.lightGrayy),
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: KSize.geHeight(context, 20)),
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Email',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                      ),
                    )),
                SizedBox(height: KSize.geHeight(context, 30)),
                Text('Password', style: KTextStyle.subTitle1),
                SizedBox(height: KSize.geHeight(context, 10)),

                /// Enter Password TextField
                Container(
                    height: KSize.geHeight(context, 52),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: KColor.lightGrayy),
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: KSize.geHeight(context, 20)),
                      child: TextField(
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        style: TextStyle(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            hintStyle: TextStyle(
                              fontFamily: 'Poppins',
                            )),
                      ),
                    )),
                SizedBox(height: KSize.geHeight(context, 50)),
                KButton(
                    buttonText: 'Save Now',
                    onPressed: () {
                      context.nextReplacementPage(BottomNavigationScreen());
                      appValueNotifier.showBottomNavBar();
                      //Navigator.pop(context);
                    }),
                SizedBox(
                    height: kBottomNavigationBarHeight +
                        KSize.geHeight(context, 110)),
              ],
            ),
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
