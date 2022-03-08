import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/screen/bottom_navigation_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String _locationChosenValue3 = 'USA';
  TextEditingController firstNameController =TextEditingController();
  TextEditingController lasNameController =TextEditingController();
  TextEditingController emailController =TextEditingController();


  final List<String> imageList = [
    'assets/images/usaFlag.png',
    'assets/images/usaFlag.png',
    'assets/images/usaFlag.png',
  ];

  @override
  void initState() {
    
    super.initState();
    firstNameController.text='Adom';
    lasNameController.text='Shafi';
    emailController.text='hellobesnik@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text('Job Apply', style: KTextStyle.headline8)),
                  Spacer()
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('First Name', style: KTextStyle.subTitle1),
                      SizedBox(height: KSize.geHeight(context, 10)),
                      Container(
                          height: KSize.geHeight(context, 52),
                          width:  KSize.geHeight(context, 170),
                          decoration: BoxDecoration(
                              color: KColor.white,
                              border: Border.all(color: KColor.lightGrayy),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            controller: firstNameController,
                            cursorColor: KColor.tertiary,
                            decoration: InputDecoration(
                                  border: InputBorder.none,
                                hintText: 'First name',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Last Name', style: KTextStyle.subTitle1),
                      SizedBox(height: KSize.geHeight(context, 10)),
                      Container(
                          height: KSize.geHeight(context, 52),
                          width:  KSize.geHeight(context, 170),
                          decoration: BoxDecoration(
                              color: KColor.white,
                              border: Border.all(color: KColor.lightGrayy),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.text,
                            controller: lasNameController,
                            cursorColor: KColor.tertiary,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Last name',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                )),
                          ))
                    ],
                  ),
                ],
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
              Text('Your Email', style: KTextStyle.subTitle1),
              SizedBox(height: KSize.geHeight(context, 10)),

              /// Email TextField
              Container(
                  height: KSize.geHeight(context, 52),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: KColor.white,
                      border: Border.all(color: KColor.lightGrayy),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.only(left: KSize.geHeight(context, 20)),
                    child: TextField(
                      keyboardType: TextInputType.text,
                       controller: emailController,
                      cursorColor: KColor.tertiary,
                      decoration: InputDecoration(
                           border: InputBorder.none,
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                    ),
                  )),
              SizedBox(height: KSize.geHeight(context, 30)),
              Text('Country', style: KTextStyle.subTitle1),
              SizedBox(height: KSize.geHeight(context, 10)),

              /// Country Drop Down
              Container(
                height: KSize.geHeight(context, 52),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.lightGrayy),
                    borderRadius: BorderRadius.circular(15),
                    color: KColor.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: KSize.getWidth(context, 15)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down,size: KSize.geHeight(context, 35),),
                      value: _locationChosenValue3,
                      style: TextStyle(color: KColor.primary),
                      items: <String>[
                        'USA',
                        'USA 2',
                        'USA 3',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Image.asset('assets/images/usaFlag.png',
                                  fit: BoxFit.contain,
                                  height: KSize.geHeight(context, 23),
                                  width: KSize.getWidth(context, 23)),
                              SizedBox(width: KSize.getWidth(context, 10)),
                              Text(value,
                                  style: KTextStyle.bodyText
                                      .copyWith(color: KColor.tertiary)),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          _locationChosenValue3 = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
              Text('Message', style: KTextStyle.subTitle1),
              SizedBox(height: KSize.geHeight(context, 10)),

              /// Message

              Container(
                height: KSize.geHeight(context, 120),
                decoration: BoxDecoration(
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: KSize.getWidth(context, 20),
                      vertical: KSize.geHeight(context, 10)),
                  child: Text(
                      'I love being a part of the creative process and the challenge of making a complicated product very simple to use.Specializing in User Experience, User Interface.',
                      style: GoogleFonts.overpass(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: KColor.secondary,
                          height: 1.6)),
                ),
              ),
              SizedBox(height: KSize.geHeight(context, 30)),
              Text('CV', style: KTextStyle.subTitle1),
              SizedBox(height: KSize.geHeight(context, 10)),

              /// Upload here
              Container(
                height: KSize.geHeight(context, 70),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: KColor.lightGrayy),
                    color: KColor.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Spacer(),
                    Text('Upload Here',
                        style: KTextStyle.button
                            .copyWith(color: KColor.secondary)),
                    Spacer(),
                    Image.asset(
                      'assets/images/uploadIcon.png',
                      height: KSize.geHeight(context, 14),
                      width: KSize.getWidth(context, 11),
                      fit: BoxFit.cover,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: KSize.geHeight(context, 27)),

              /// Button
              KButton(
                buttonText: 'Apply Now',
                onPressed: () {
                  context.nextPage(BottomNavigationScreen());
                  //Navigator.pop(context);
                },
              ),
              SizedBox(
                  height:
                      kBottomNavigationBarHeight + KSize.geHeight(context, 29)),
            ],
          ),
        ),
      ),
    );
  }
}
