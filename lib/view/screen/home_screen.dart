import 'package:application/custom_plugin/kf_drawer.dart';
import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:application/view/screen/form_screen.dart';
import 'package:application/view/screen/message_screen.dart';
import 'package:application/view/screen/profile_screen.dart';
import 'package:application/view/screen/search_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomeScreen extends KFDrawerContent {
  HomeScreen({Key key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  String _chosenValue = 'UI/UX Design';
  String _chosenValue2 = 'Graphics Design';
  String _locationChosenValue3 = 'Canada';
  String dollarChosenValue = '\$2k-\$5k';
  final List<String> imageList = [
    'assets/images/google.png',
    'assets/images/spotify.png',
    'assets/images/facebook.png',
  ];
  final List<String> recentPostImageList = [
    'assets/images/facebook.png',
    'assets/images/spoti.png',
    'assets/images/netflix.png',
  ];

  final List<String> iconName = [
    'Google',
    'Spotify',
    'Facebook',
  ];
  final List<String> jobTitle = [
    'Lead Product Manager',
    'Senior UI/UX Designer',
    'Senior App Developer',
  ];

  final List<String> recentPostJobTitle = [
    'UI/UX Designer',
    'Product Designer',
    'Visual Designer',
  ];
  final List<String> categoryList = [
    'Description',
    'Company',
    'Reviews',
  ];
  final List<String> qualificationList = [
    'Exceptional communication skills and team\nworking skill',
    'Creative with an eye for shape and colour',
    'Know the principal of animation and you can\ncreate high prototypes',
    'Figma,Xd & Sketch must know about this apps'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: KSize.geHeight(context, 60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    //appValueNotifier.showBottomNavBar();
                    appValueNotifier.hideBottomNavBar();
                    widget.onMenuPressed();
                  },
                  child: Image.asset(
                    'assets/images/menu.png',
                    height: KSize.geHeight(context, 44),
                    width: KSize.getWidth(context, 44),
                    fit: BoxFit.contain,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.nextPage(ProfileScreen(dataPass: true)),
                  child: Image.asset('assets/images/profile.png',
                      fit: BoxFit.scaleDown,
                      height: KSize.geHeight(context, 44),
                      width: KSize.getWidth(context, 44)),
                ),
              ],
            ),
            SizedBox(height: KSize.geHeight(context, 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                      height: KSize.geHeight(context, 51),
                      decoration: BoxDecoration(
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextField(
                          onTap: (){
                            context.nextPage(SearchScreen());
                          },
                          readOnly: true,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              hintText: 'Search here...',
                              hintStyle: TextStyle(fontFamily: 'Poppins'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 20))),
                          onChanged: (key) {},
                        ),
                      )),
                ),
                SizedBox(width: KSize.getWidth(context, 15)),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Container(
                                  height: KSize.geHeight(context, 708),
                                  decoration: BoxDecoration(
                                      color: KColor.gray98,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: KSize.getWidth(context, 20),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 10)),
                                          Center(
                                            child: Image.asset(
                                              'assets/images/bottomSheet.png',
                                              height:
                                                  KSize.geHeight(context, 4),
                                              width:
                                                  KSize.getWidth(context, 80),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 25)),

                                          /// Set Filters
                                          Center(
                                            child: Text(
                                              'Set Filters',
                                              style: KTextStyle.headline8
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 28)),
                                          Text(
                                            'Category',
                                            style: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 15)),

                                          ///  Category Dropdown
                                          Container(
                                            height: KSize.geHeight(context, 54),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: KColor.white),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: KSize.getWidth(
                                                      context, 20)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  value: _chosenValue,
                                                  //elevation: 5,
                                                  style: TextStyle(
                                                      color: KColor.primary),
                                                  items: <String>[
                                                    'UI/UX Design',
                                                    'Product Design',
                                                    'Visual Design',
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: KColor
                                                                    .tertiary),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String value) {
                                                    setState(() {
                                                      _chosenValue = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),
                                          Text('Sub Category',
                                              style: KTextStyle.headline8
                                                  .copyWith(fontSize: 18)),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 15)),

                                          /// Sub Category Dropdown
                                          Container(
                                            height: KSize.geHeight(context, 54),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: KColor.white),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: KSize.getWidth(
                                                      context, 20)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton<String>(
                                                  icon: Icon(Icons
                                                      .keyboard_arrow_down),
                                                  value: _chosenValue2,
                                                  style: TextStyle(
                                                      color: KColor.primary),
                                                  items: <String>[
                                                    'Graphics Design',
                                                    'Product Design',
                                                    'Visual Design',
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value,
                                                          style: KTextStyle
                                                              .bodyText
                                                              .copyWith(
                                                                  color: KColor
                                                                      .tertiary)),
                                                    );
                                                  }).toList(),
                                                  onChanged: (String value) {
                                                    setState(() {
                                                      _chosenValue2 = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),

                                          /// Location .... Salary
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Location',
                                                    style: KTextStyle.headline8
                                                        .copyWith(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  SizedBox(
                                                      height: KSize.geHeight(
                                                          context, 16)),
                                                  Container(
                                                    height: KSize.geHeight(
                                                        context, 54),
                                                    width: KSize.getWidth(
                                                        context, 160),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: KColor.white),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      10)),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/images/location.png',
                                                              fit: BoxFit.cover,
                                                              height: KSize
                                                                  .geHeight(
                                                                      context,
                                                                      20),
                                                              width: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      20)),
                                                          SizedBox(
                                                              width: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      15)),
                                                          DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down),
                                                              value:
                                                                  _locationChosenValue3,
                                                              style: TextStyle(
                                                                  color: KColor
                                                                      .primary),
                                                              items: <String>[
                                                                'Canada',
                                                                'Nepal',
                                                                'India',
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: KSize.getWidth(
                                                                            context,
                                                                            15.0)),
                                                                    child: Text(
                                                                        value,
                                                                        style: KTextStyle
                                                                            .bodyText
                                                                            .copyWith(color: KColor.tertiary)),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String
                                                                  value) {
                                                                setState(() {
                                                                  _locationChosenValue3 =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Salary',
                                                    style: KTextStyle.headline8
                                                        .copyWith(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                  ),
                                                  SizedBox(
                                                      height: KSize.geHeight(
                                                          context, 16)),
                                                  Container(
                                                    height: KSize.geHeight(
                                                        context, 54),
                                                    width: KSize.getWidth(
                                                        context, 160),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color: KColor.white),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      10)),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              'assets/images/wallet.png',
                                                              fit: BoxFit.cover,
                                                              //scale: 2.5,
                                                              height: KSize
                                                                  .geHeight(
                                                                      context,
                                                                      20),
                                                              width: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      20)),
                                                          SizedBox(
                                                              width: KSize
                                                                  .getWidth(
                                                                      context,
                                                                      15)),
                                                          DropdownButtonHideUnderline(
                                                            child:
                                                                DropdownButton<
                                                                    String>(
                                                              icon: Icon(Icons
                                                                  .keyboard_arrow_down),
                                                              value:
                                                                  dollarChosenValue,
                                                              style: TextStyle(
                                                                  color: KColor
                                                                      .primary),
                                                              items: <String>[
                                                                '\$2k-\$5k',
                                                                '\$5k-\$10k',
                                                                '\$7k-\$12k',
                                                              ].map<
                                                                  DropdownMenuItem<
                                                                      String>>((String
                                                                  value) {
                                                                return DropdownMenuItem<
                                                                    String>(
                                                                  value: value,
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.only(
                                                                        right: KSize.getWidth(
                                                                            context,
                                                                            9.0)),
                                                                    child: Text(
                                                                        value,
                                                                        style: KTextStyle
                                                                            .bodyText
                                                                            .copyWith(color: KColor.tertiary)),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                              onChanged: (String
                                                                  value) {
                                                                setState(() {
                                                                  dollarChosenValue =
                                                                      value;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),

                                          /// Job Type
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Job Type',
                                                  style: KTextStyle.headline8
                                                      .copyWith(fontSize: 18)),
                                              Icon(Icons.more_horiz_sharp)
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),

                                          /// Job Type List

                                          Wrap(
                                            direction: Axis.horizontal,
                                            spacing:
                                                KSize.getWidth(context, 13),
                                            runSpacing:
                                                KSize.geHeight(context, 14),
                                            children: [
                                              CategoryList(
                                                  index: 0,
                                                  categoryList: 'Full Time',
                                                  width: KSize.getWidth(
                                                      context, 100)),
                                              CategoryList(
                                                  index: 1,
                                                  categoryList: 'Part Time',
                                                  width: KSize.getWidth(
                                                      context, 100)),
                                              CategoryList(
                                                  index: 2,
                                                  categoryList: 'Contract',
                                                  width: KSize.getWidth(
                                                      context, 95)),
                                              CategoryList(
                                                  index: 3,
                                                  categoryList: 'Freelance',
                                                  width: KSize.getWidth(
                                                      context, 100)),
                                              CategoryList(
                                                  index: 4,
                                                  categoryList: 'Remote',
                                                  width: KSize.getWidth(
                                                      context, 86)),
                                              CategoryList(
                                                categoryList: 'Show All Type',
                                                width: KSize.getWidth(
                                                    context, 120),
                                                index: 5,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 40)),
                                          KButton(
                                              buttonText: 'Apply Filters',
                                              onPressed: () {
                                               context.nextReplacementPage(SearchScreen());
                                              }),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                           
                    },
                    child: Image.asset('assets/images/btn.png',
                        fit: BoxFit.contain,
                        height: KSize.geHeight(context, 54),
                        width: KSize.getWidth(context, 54)),
                  ),
                )
              ],
            ),
            SizedBox(height: KSize.geHeight(context, 30)),

            ///Text Popular Job

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular Job', style: KTextStyle.headline8),
                Text('Show All', style: KTextStyle.caption),
              ],
            ),

            /// Spacing

            SizedBox(height: KSize.geHeight(context, 20)),

            ///  Popular Job List
            ClipRRect(
             // borderRadius: BorderRadius.circular(15),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: (){
                    showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Container(
                                  height: KSize.geHeight(context, 708),
                                  decoration: BoxDecoration(
                                      color: KColor.gray98,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              KSize.getWidth(context, 20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 10)),
                                          Center(
                                            child: Image.asset(
                                              'assets/images/bottomSheet.png',
                                              height:
                                                  KSize.geHeight(context, 4),
                                              width:
                                                  KSize.getWidth(context, 80),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 32)),

                                          /// Spotify Image
                                          Center(
                                            child: Image.asset(
                                                'assets/images/spoti.png',
                                                height:
                                                    KSize.geHeight(context, 70),
                                                width:
                                                    KSize.getWidth(context, 70),
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),

                                          /// UI Design Lead
                                          Center(
                                            child: Text(
                                              'UI Design Lead',
                                              style: KTextStyle.headline8
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Spotify',
                                                  style: KTextStyle.button
                                                      .copyWith(
                                                          color: KColor
                                                              .secondary)),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 7)),
                                              Image.asset(
                                                'assets/images/line2.png',
                                                height:
                                                    KSize.geHeight(context, 2),
                                                width:
                                                    KSize.getWidth(context, 15),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 10)),
                                              Image.asset(
                                                'assets/images/location.png',
                                                height:
                                                    KSize.geHeight(context, 18),
                                                width:
                                                    KSize.getWidth(context, 18),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 5)),
                                              Text(
                                                'Toronto Canada',
                                                style: KTextStyle.button
                                                    .copyWith(
                                                        color: KColor.tertiary),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 28)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              Image.asset(
                                                'assets/images/clock.png',
                                                height:
                                                    KSize.geHeight(context, 20),
                                                width:
                                                    KSize.getWidth(context, 20),
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 9)),
                                              Text('Full Time',
                                                  style: KTextStyle.subTitle1
                                                      .copyWith(fontSize: 18)),
                                              Spacer(),
                                              Text('\$1200/m',
                                                  style: KTextStyle.subTitle1
                                                      .copyWith(fontSize: 18)),
                                              Spacer(),
                                            ],
                                          ),

                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),
                                          SizedBox(
                                            height: KSize.geHeight(context, 50),
                                            child: ListView.builder(
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: KSize.geHeight(
                                                          context, 50),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: selectedIndex ==
                                                              index
                                                          ? BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: KColor
                                                                  .primary)
                                                          : BoxDecoration(
                                                              color: Colors
                                                                  .transparent),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: KSize
                                                                    .getWidth(
                                                                        context,
                                                                        20)),
                                                        child: Text(
                                                            categoryList[index],
                                                            style: KTextStyle
                                                                .button
                                                                .copyWith(
                                                                    color: selectedIndex ==
                                                                            index
                                                                        ? KColor
                                                                            .white
                                                                        : KColor
                                                                            .tertiary)),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),

                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 40)),
                                          Text('Qualifications:',
                                              style: KTextStyle.headline8
                                                  .copyWith(fontSize: 18)),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),

                                          /// List For Qualifications
                                          SizedBox(
                                            height:
                                                KSize.geHeight(context, 200),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    qualificationList.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: KSize.geHeight(
                                                            context, 25),),
                                                    child: 
                                                    
                                                    
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.only(top:KSize.geHeight(context, 8)),
                                                          child: Image.asset(
                                                              'assets/images/circle.png',
                                                              fit: BoxFit.contain,
                                                              width:
                                                                  KSize.getWidth(
                                                                      context, 5),
                                                              height:
                                                                  KSize.geHeight(
                                                                      context,
                                                                      5)),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                KSize.getWidth(
                                                                    context,
                                                                    10)),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                              qualificationList[
                                                                  index],
                                                              style: KTextStyle
                                                                  .bodyText2
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13)),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),

                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: KButton(
                                                    buttonText: 'Apply Now',
                                                    onPressed: () {
                                                      context
                                                          .nextReplacementPage(
                                                              FormScreen());
                                                    }),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 20)),
                                              GestureDetector(
                                                onTap: () {
                                                  context.nextPage(
                                                      MessageScreen(
                                                          dataPass: true));
                                                },
                                                child: Image.asset(
                                                  'assets/images/messageBtn.png',
                                                  fit: BoxFit.contain,
                                                  height: KSize.geHeight(
                                                      context, 54),
                                                  width: KSize.getWidth(
                                                      context, 54),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                
                
                child: Container(
                  height: KSize.geHeight(context, 175),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    //borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: imageList.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.only(right: KSize.getWidth(context, 20),bottom: 5,top: 5,left: 5),
                          child: Container(
                            height: KSize.geHeight(context, 160),
                            width: KSize.getWidth(context, 260),
                            decoration: BoxDecoration(
                              color: KColor.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: KColor.grey.withOpacity(0.2),
                                  offset: Offset(4,2),
                                  blurRadius: 5.0,
                                  spreadRadius: 1.0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: KSize.geHeight(context, 15),
                                 // left: KSize.getWidth(context, 15),
                                  right: KSize.getWidth(context, 20),
                                  bottom: KSize.geHeight(context, 24)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:  EdgeInsets.only(left:KSize.getWidth(context, 10)),
                                        child: Container(
                                          height: KSize.geHeight(context, 40),
                                            width: KSize.getWidth(context, 40),
                                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(imageList[index]),fit: BoxFit.contain) ),
                                        ),
                                      ),
                                     
                                      SizedBox(
                                          height: KSize.geHeight(context, 5)),
                                      Padding(
                                        padding:  EdgeInsets.only(left:KSize.getWidth(context, 15)),
                                        child: Text(iconName[index],
                                            style: KTextStyle.caption),
                                      ),
              
                                      Spacer(),
                                      Padding(
                                        padding:  EdgeInsets.only(left:KSize.getWidth(context, 15)),
                                        child: Text(
                                          jobTitle[index],
                                          style: KTextStyle.bodyText
                                              .copyWith(color: KColor.secondary),
                                        ),
                                      ),
                                      Spacer(),
              
                                      /// Rich Text For dollar and country name
              
                                      Padding(
                                        padding:  EdgeInsets.only(left:KSize.getWidth(context, 15)),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: '\$2500/m',
                                              style: KTextStyle.caption1),
                                          TextSpan(
                                              text: ' Toronto, Canada',
                                              style: KTextStyle.caption)
                                        ])),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:KSize.geHeight(context, 8)),
                                    child: Align(
                                        alignment: Alignment.topRight,
                                        child: Icon(
                                          Icons.favorite,
                                          color: KColor.red,
                                        )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),

            /// Spacing
            SizedBox(height: KSize.geHeight(context, 30)),

            /// Recent post Text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Post', style: KTextStyle.headline8),
                Text('Show All', style: KTextStyle.caption)
              ],
            ),

            /// Spacing
            SizedBox(height: KSize.geHeight(context, 20)),

            /// Recent Post List
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: recentPostJobTitle.length,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                                return Container(
                                  height: KSize.geHeight(context, 708),
                                  decoration: BoxDecoration(
                                      color: KColor.gray98,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50))),
                                  child: SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              KSize.getWidth(context, 20)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 10)),
                                          Center(
                                            child: Image.asset(
                                              'assets/images/bottomSheet.png',
                                              height:
                                                  KSize.geHeight(context, 4),
                                              width:
                                                  KSize.getWidth(context, 80),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 32)),

                                          /// Spotify Image
                                          Center(
                                            child: Image.asset(
                                                'assets/images/spoti.png',
                                                height:
                                                    KSize.geHeight(context, 70),
                                                width:
                                                    KSize.getWidth(context, 70),
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),

                                          /// UI Design Lead
                                          Center(
                                            child: Text(
                                              'UI Design Lead',
                                              style: KTextStyle.headline8
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text('Spotify',
                                                  style: KTextStyle.button
                                                      .copyWith(
                                                          color: KColor
                                                              .secondary)),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 7)),
                                              Image.asset(
                                                'assets/images/line2.png',
                                                height:
                                                    KSize.geHeight(context, 2),
                                                width:
                                                    KSize.getWidth(context, 15),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 10)),
                                              Image.asset(
                                                'assets/images/location.png',
                                                height:
                                                    KSize.geHeight(context, 18),
                                                width:
                                                    KSize.getWidth(context, 18),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 5)),
                                              Text(
                                                'Toronto Canada',
                                                style: KTextStyle.button
                                                    .copyWith(
                                                        color: KColor.tertiary),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 28)),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Spacer(),
                                              Image.asset(
                                                'assets/images/clock.png',
                                                height:
                                                    KSize.geHeight(context, 20),
                                                width:
                                                    KSize.getWidth(context, 20),
                                                fit: BoxFit.cover,
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 9)),
                                              Text('Full Time',
                                                  style: KTextStyle.subTitle1
                                                      .copyWith(fontSize: 18)),
                                              Spacer(),
                                              Text('\$1200/m',
                                                  style: KTextStyle.subTitle1
                                                      .copyWith(fontSize: 18)),
                                              Spacer(),
                                            ],
                                          ),

                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),
                                          SizedBox(
                                            height: KSize.geHeight(context, 50),
                                            child: ListView.builder(
                                                itemCount: 3,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: () {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    child: Container(
                                                      height: KSize.geHeight(
                                                          context, 50),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: selectedIndex ==
                                                              index
                                                          ? BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                              color: KColor
                                                                  .primary)
                                                          : BoxDecoration(
                                                              color: Colors
                                                                  .transparent),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: KSize
                                                                    .getWidth(
                                                                        context,
                                                                        20)),
                                                        child: Text(
                                                            categoryList[index],
                                                            style: KTextStyle
                                                                .button
                                                                .copyWith(
                                                                    color: selectedIndex ==
                                                                            index
                                                                        ? KColor
                                                                            .white
                                                                        : KColor
                                                                            .tertiary)),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),

                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 40)),
                                          Text('Qualifications:',
                                              style: KTextStyle.headline8
                                                  .copyWith(fontSize: 18)),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 20)),

                                          /// List For Qualifications
                                          SizedBox(
                                            height:
                                                KSize.geHeight(context, 200),
                                            child: ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    qualificationList.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: EdgeInsets.only(
                                                        bottom: KSize.geHeight(
                                                            context, 25),),
                                                    child: 
                                                    
                                                    
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding:  EdgeInsets.only(top:KSize.geHeight(context, 8)),
                                                          child: Image.asset(
                                                              'assets/images/circle.png',
                                                              fit: BoxFit.contain,
                                                              width:
                                                                  KSize.getWidth(
                                                                      context, 5),
                                                              height:
                                                                  KSize.geHeight(
                                                                      context,
                                                                      5)),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                KSize.getWidth(
                                                                    context,
                                                                    10)),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: Text(
                                                              qualificationList[
                                                                  index],
                                                              style: KTextStyle
                                                                  .bodyText2
                                                                  .copyWith(
                                                                      fontSize:
                                                                          13)),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30)),

                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 4,
                                                child: KButton(
                                                    buttonText: 'Apply Now',
                                                    onPressed: () {
                                                      context
                                                          .nextReplacementPage(
                                                              FormScreen());
                                                    }),
                                              ),
                                              SizedBox(
                                                  width: KSize.getWidth(
                                                      context, 20)),
                                              GestureDetector(
                                                onTap: () {
                                                  context.nextPage(
                                                      MessageScreen(
                                                          dataPass: true));
                                                },
                                                child: Image.asset(
                                                  'assets/images/messageBtn.png',
                                                  fit: BoxFit.contain,
                                                  height: KSize.geHeight(
                                                      context, 54),
                                                  width: KSize.getWidth(
                                                      context, 54),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                              height:
                                                  KSize.geHeight(context, 30))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: Card(
                          shadowColor: KColor.shade.withOpacity(0.5),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          margin:
                              EdgeInsets.only(bottom: KSize.geHeight(context, 20)),
                          child: Container(
                            height: KSize.geHeight(context, 80),
                             decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: KColor.grey.withOpacity(0.2),
                                    offset: Offset(4,1),
                                    blurRadius: 5.0,
                                    spreadRadius: 1.0,
                                  ),
                                ],
                              ),
                            
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 10),
                                  vertical: KSize.geHeight(context, 15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    recentPostImageList[index],
                                    height: KSize.geHeight(context, 50),
                                    width: KSize.getWidth(context, 50),
                                    fit: BoxFit.contain,
                                  ),
                                 // Spacer(),
                                  SizedBox(width: KSize.getWidth(context, 20)),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(recentPostJobTitle[index],
                                          style: KTextStyle.headline8
                                              .copyWith(fontSize: 16)),
                                      Spacer(),
                                      Text('Full Time', style: KTextStyle.caption)
                                    ],
                                  ),
                                  Spacer(),
                                  Text('\$4500/m', style: KTextStyle.caption)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
                height:
                    kBottomNavigationBarHeight + KSize.geHeight(context, 20))
          ],
        ),
      ),
    );
  }
}
