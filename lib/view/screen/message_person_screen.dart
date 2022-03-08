import 'package:application/view/screen/in_call_screen.dart';
import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MessagePersonScreen extends StatelessWidget {
  const MessagePersonScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        titleSpacing: 0.0,
        title: Padding(
          padding: EdgeInsets.only(
            left: KSize.getWidth(context, 20),
            right: KSize.getWidth(context, 20),
            top: KSize.geHeight(context, 25),
          ),
          child: Row(
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
              Image.asset(
                'assets/images/avatar2.png',
                height: KSize.geHeight(context, 27),
                width: KSize.getWidth(context, 27),
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: KSize.getWidth(context, 8)),
              Text('Anaya Sanji',
                  style: KTextStyle.headline8.copyWith(fontSize: 16)),
              Spacer(),

              /// Make phone Calls
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  context.nextPage(InCallScreen());
                },
                child: Image.asset('assets/images/call.png',
                    fit: BoxFit.scaleDown,
                    height: KSize.geHeight(context, 20),
                    width: KSize.getWidth(context, 20)),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    /// Spacing
                    SizedBox(height: KSize.geHeight(context, 40)),
          
                    /// Design Start
          
                    Column(
                      children: [
                        /// Hello
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: KSize.geHeight(context, 55),
                            width: KSize.getWidth(context, 110),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: KColor.gray),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Hello',
                                      style: KTextStyle.button.copyWith(
                                          color: KColor.secondary, height: 1),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '4:34 PM',
                                      style: KTextStyle.caption.copyWith(
                                          color: KColor.lightness, height: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// Hi....
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: KSize.geHeight(context, 55),
                            width: KSize.getWidth(context, 110),
                            decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Hi',
                                      style: KTextStyle.button
                                          .copyWith(color: KColor.secondary),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '4:34 PM',
                                      style: KTextStyle.caption.copyWith(
                                          color: KColor.lightness, height: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// How are you
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: KSize.geHeight(context, 56),
                            width: KSize.getWidth(context, 181),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: KColor.gray),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'How are You?',
                                          style: KTextStyle.button.copyWith(
                                              color: KColor.secondary, height: 1),
                                        ),
                                        Image.asset(
                                          'assets/images/winking.png',
                                          height: KSize.geHeight(context, 20),
                                          width: KSize.getWidth(context, 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '4:35 PM',
                                      style: KTextStyle.caption.copyWith(
                                          color: KColor.lightness, height: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// Nice bro
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: KSize.geHeight(context, 55),
                            width: KSize.getWidth(context, 233),
                            decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Nice,bro',
                                      style: KTextStyle.button.copyWith(
                                          color: KColor.secondary, height: 1),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('4:34 PM',
                                        style: KTextStyle.caption
                                            .copyWith(color: KColor.lightness)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// I Heard u guys....
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: KSize.geHeight(context, 77),
                            width: KSize.getWidth(context, 248),
                            decoration: BoxDecoration(
                                color: KColor.gray,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'I heard u guys launching ',
                                      style: KTextStyle.button
                                          .copyWith(color: KColor.secondary),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'new product?',
                                      style: KTextStyle.button.copyWith(
                                          color: KColor.secondary, height: 1),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text('4:34 PM',
                                        style: KTextStyle.caption.copyWith(
                                            color: KColor.lightness, height: 1)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// Yes, It Calls UI HUT
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: KSize.geHeight(context, 76),
                            width: KSize.getWidth(context, 212),
                            decoration: BoxDecoration(
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Yes,It Calls UiHut',
                                      style: KTextStyle.button
                                          .copyWith(color: KColor.secondary),
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '4:34 PM',
                                      style: KTextStyle.caption
                                          .copyWith(color: KColor.lightness),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: KSize.geHeight(context, 16)),
          
                        /// That's awesome
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: KSize.geHeight(context, 63),
                            width: KSize.getWidth(context, 238),
                            decoration: BoxDecoration(
                                color: KColor.gray,
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 16),
                                  vertical: KSize.geHeight(context, 8)),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Text(
                                          'That\'s Awesome',
                                          style: KTextStyle.button
                                              .copyWith(color: KColor.secondary),
                                        ),
                                        Image.asset('assets/images/smiley.png',
                                            height: KSize.geHeight(context, 20),
                                            width: KSize.getWidth(context, 20))
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      '4:34 PM',
                                      style: KTextStyle.caption
                                          .copyWith(color: KColor.lightness),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
          
                    /// Last part ( add+ Type a message)
                    SizedBox(height: KSize.geHeight(context, 78)),
                  
                    
                  ],
                ),
              ),
            ),
          ),
            Container(
             margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 20)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: KSize.geHeight(context, 46),
                        width: KSize.getWidth(context, 46),
                        decoration: BoxDecoration(
                            color: KColor.primary, shape: BoxShape.circle),
                        child: Icon(
                          Icons.add,
                          color: KColor.white,
                        ),
                      ),
                    ),
                    SizedBox(width: KSize.getWidth(context, 11)),
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
                              decoration: InputDecoration(
                                  hintText: 'Type a message',
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: KColor.lightShadeOfBlue),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(15)),
                                  suffixIcon: Image.asset(
                                    'assets/images/send.png',
                                    scale: 3.8,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: KSize.getWidth(context, 20))),
                              onChanged: (key) {},
                            ),
                          )),
                    ),
                  ],
                ),
            ),
              SizedBox(height: KSize.geHeight(context, 30)),
        ],
      ),
    );
  }
}
