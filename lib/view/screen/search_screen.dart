import 'package:application/view/global_widgets/k_button.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  int secondaryIndex = 0;
  String _chosenValue = 'UI/UX Design';
  String _chosenValue2 = 'Graphics Design';
  String _locationChosenValue3 = 'Canada';
  String dollarChosenValue = '\$2k-\$5k';
  List<String> notes = [];
  TextEditingController searchTextController = TextEditingController();

  List<String> search(String key) {
    return designationList
        .where((developer) =>
            developer.toLowerCase().startsWith(key.toLowerCase()))
        .toList();
  }

  final List<String> imageList = [
    'assets/images/facebook.png',
    'assets/images/dribble.png',
    'assets/images/google.png',
    'assets/images/spoti.png',
    'assets/images/netflix.png',
  ];
  final List<String> logoNameList = [
    'Facebook',
    'Dribble',
    'Google',
    'Shopify',
    'Netflix',
  ];
  final List<String> designationList = [
    'UI/UX Designer',
    'Product Designer',
    'Senior UX Designer',
    'Visual Designer',
    'Visual Designer',
  ];
  final List<String> hourList = [
    '06h',
    '12h',
    '24hr',
    '24h',
    '24h',
  ];
  final List<String> stateNameList = [
    'Toronto,Canada',
    'Toronto,Canada',
    'New York,USA',
    'New York,USA',
    'New York,USA',
  ];
  final List<String> salaryList = [
    '\$4500/m',
    '\$6000/m',
    '\$4500/m',
    '\$1200/m',
    '\$4500/m',
  ];
  @override
  void initState() {
    super.initState();
    searchTextController.text = 'Ui Design';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    child: Text('Search', style: KTextStyle.headline8)),
                Spacer()
              ],
            ),

            /// Spacing
            SizedBox(height: KSize.geHeight(context, 24)),

            /// TextField for search filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                      height: KSize.geHeight(context, 54),
                      decoration: BoxDecoration(
                        color: KColor.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: searchTextController,
                          decoration: InputDecoration(
                              hintText: 'Search here...',
                              hintStyle: TextStyle(fontFamily: 'Poppins'),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(15)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 20))),
                          onChanged: (key) {
                            setState(() {
                              if (key.isEmpty) {
                                notes = [];
                              } else {
                                notes = search(key);
                              }
                            });
                          },
                        ),
                      )),
                ),
                SizedBox(width: KSize.getWidth(context, 15)),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
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
                                                Navigator.pop(context);
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
                        fit: BoxFit.fitWidth,
                        height: KSize.geHeight(context, 54),
                        width: KSize.getWidth(context, 54)),
                  ),
                )
              ],
            ),

            /// Spacing
            SizedBox(height: KSize.geHeight(context, 18)),
            Text('35 Job Opportunity',
                style: KTextStyle.subTitle1.copyWith(color: KColor.secondary)),
            SizedBox(height: KSize.geHeight(context, 14)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Container(
                    height: KSize.geHeight(context, 50),
                    alignment: Alignment.center,
                    decoration: selectedIndex == 0
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: KColor.primary)
                        : BoxDecoration(color: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 20)),
                      child: Text('Most Relevant',
                          style: KTextStyle.bodyText2.copyWith(
                              color: selectedIndex == 0
                                  ? KColor.white
                                  : KColor.tertiary)),
                    ),
                  ),
                ),
                SizedBox(
                  width: KSize.getWidth(context, 15),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Container(
                    height: KSize.geHeight(context, 50),
                    alignment: Alignment.center,
                    decoration: selectedIndex == 1
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: KColor.primary)
                        : BoxDecoration(color: Colors.transparent),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 20)),
                      child: Text('Most Recent',
                          style: KTextStyle.bodyText2.copyWith(
                              color: selectedIndex == 1
                                  ? KColor.white
                                  : KColor.tertiary)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: KSize.geHeight(context, 20)),

            /// Most Relevant List
            Expanded(
              child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: KColor.gray98.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Container(
                        height: KSize.geHeight(context, 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 10),
                            // vertical: KSize.geHeight(context, 22),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: KSize.geHeight(context, 22)),
                                child: Image.asset(
                                  imageList[index],
                                  height: KSize.geHeight(context, 50),
                                  width: KSize.getWidth(context, 50),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(width: KSize.getWidth(context, 15)),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: KSize.geHeight(context, 22)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(logoNameList[index],
                                        style: KTextStyle.caption
                                            .copyWith(height: 1)),
                                    Spacer(),
                                    Text(designationList[index],
                                        style: KTextStyle.headline8.copyWith(
                                            fontSize: 16,
                                            height: 1,
                                            fontWeight: FontWeight.w700)),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(salaryList[index],
                                            style: KTextStyle.caption
                                                .copyWith(height: 1)),
                                        SizedBox(
                                            width: KSize.getWidth(context, 10)),
                                        Text(stateNameList[index],
                                            style: KTextStyle.caption
                                                .copyWith(height: 1)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: KSize.geHeight(context, 10)),
                                    child: Column(
                                      children: [
                                        Container(
                                            height: KSize.geHeight(context, 28),
                                            width: KSize.getWidth(context, 28),
                                            decoration: BoxDecoration(
                                                color: KColor.backgroundColor,
                                                shape: BoxShape.circle
                                                //borderRadius: BorderRadius.circular(20),
                                                ),
                                            child: Center(
                                                child: Icon(
                                              Icons.favorite,
                                              color: KColor.red,
                                              size: KSize.geHeight(context, 20),
                                            ))),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom:
                                                  KSize.geHeight(context, 22)),
                                          child: Text(hourList[index],
                                              style: KTextStyle.caption1
                                                  .copyWith(
                                                      color: KColor.tertiary)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final String categoryList;
  final double width;
  final int index;

  const CategoryList({
    Key key,
    @required this.categoryList,
    this.index,
    this.width,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List<int> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_selectedItems.contains(widget.index)) {
          setState(() {
            _selectedItems.removeWhere((val) => val == widget.index);
          });
        } else {
          setState(() {
            _selectedItems.add(widget.index);
          });
        }
      },
      child: Column(
        children: [
          Container(
            height: KSize.geHeight(context, 35),
            width: widget.width,
            alignment: Alignment.center,
            decoration: widget.index != 5
                ? BoxDecoration(
                    border: Border.all(
                        color: (_selectedItems.contains(widget.index))
                            ? Colors.transparent
                            : KColor.tertiary),
                    color: (_selectedItems.contains(widget.index))
                        ? KColor.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10))
                : BoxDecoration(color: Colors.transparent),
            child: Text(
              widget.categoryList,
              style: KTextStyle.button.copyWith(
                  color: widget.index != 2
                      ? (_selectedItems.contains(widget.index))
                          ? KColor.white
                          : KColor.tertiary
                      : KColor.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}
