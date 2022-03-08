import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:async';
import 'package:intl/intl.dart';

import '../../main.dart';

class InCallScreen extends StatefulWidget {
  const InCallScreen({Key key}) : super(key: key);

  @override
  _InCallScreenState createState() => _InCallScreenState();
}

class _InCallScreenState extends State<InCallScreen> {
  CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });

    /// for timer
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  String _timeString;
  bool isMuted = true;
  bool isVideoCall = false;
  bool isSwap = false;
  bool isCameraOn = false;

  void onChanged(bool change) {
    isMuted = change;
  }

  /// For Real Time
  void _getTime() {
    final String formattedDateTime =
        DateFormat('h:mm:ss').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      print(_timeString);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
              height: context.screenHeight,
              width: context.screenWidth,
              child: isVideoCall
                  ? CameraPreview(controller)
                  : Container(
                      
                      decoration: BoxDecoration(
                        color: KColor.lightShadeOfBlue,
                        image: DecorationImage(
                          image: AssetImage('assets/images/callBg.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    )),

          /// AppBar Icon
          Positioned(
            left: KSize.getWidth(context, 20),
            top: KSize.geHeight(context, 60),
            child: GestureDetector(
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
          ),

         // if (isVideoCall == true)

            /// Video Man
            Positioned(
              right: KSize.getWidth(context, 18),
              top: KSize.geHeight(context, 50),
              child: 
              Container(
                height:  KSize.getWidth(context, 120),
                width: KSize.geHeight(context, 80),
                decoration: BoxDecoration(
                 image:  DecorationImage(
                          image: AssetImage('assets/images/videoMan.png'),
                          fit: BoxFit.contain
                        )
                      ),
                
             
              )
                //  : ClipRRect(
                    //  borderRadius: BorderRadius.circular(15),
                      //child: Container(
                         // height: KSize.geHeight(context, 115),
                          //width: KSize.getWidth(context, 76),
                         // child: CameraPreview(controller)),
                   // ),
            ),
          //if (isVideoCall == true)
            // Positioned(
            //   top: KSize.geHeight(context, 146),
            //   right: KSize.getWidth(context, 40),
            //   child: GestureDetector(
            //     onTap: () {
            //       setState(() {
            //         isSwap = !isSwap;
            //       });
            //     },
            //     child: Image.asset(
            //       'assets/images/rotation.png',
            //       height: KSize.geHeight(context, 32),
            //       width: KSize.getWidth(context, 32),
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ),
            // ),

          /// Name
          Positioned(
              top: KSize.geHeight(context, 570),
              left: KSize.getWidth(context, 114),
              child: Text(
                'Darlene Robertson',
                style: KTextStyle.bodyText,
              )),
          Positioned(
            top: KSize.geHeight(context, 600),
            left: KSize.getWidth(context, 165),
            child: Text(
              _timeString.toString(),
              textAlign: TextAlign.center,
              style: KTextStyle.bodyText.copyWith(fontSize: 13),
            ),
          ),
          Positioned(
            top: KSize.geHeight(context, 700),
            left: KSize.getWidth(context, 78),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    onChanged(isMuted = !isMuted);
                  },
                  child: Container(
                    height: KSize.geHeight(context, 46),
                    width: KSize.getWidth(context, 46),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: KColor.white),
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: KSize.getWidth(context, 10),
                          vertical: KSize.geHeight(context, 10)),
                      child: isMuted
                          ? Image.asset('assets/images/mic.png',
                              scale: 5.0,
                              fit: BoxFit.cover,
                              height: KSize.geHeight(context, 18),
                              width: KSize.getWidth(context, 18))
                          : Padding(
                              padding: EdgeInsets.all(3.0),
                              child: Image.asset('assets/images/mute1.png',
                                  scale: 5.0,
                                  fit: BoxFit.cover,
                                  color: KColor.white,
                                  height: KSize.geHeight(context, 18),
                                  width: KSize.getWidth(context, 18)),
                            ),
                    ),
                  ),
                ),
                SizedBox(width: KSize.getWidth(context, 41)),
                InkWell(
                  onTap: () {
                    context.pop(context);
                  },
                  child: Image.asset('assets/images/endCall.png',
                      height: KSize.geHeight(context, 47),
                      width: KSize.getWidth(context, 47)),
                ),
                SizedBox(width: KSize.getWidth(context, 41)),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVideoCall = !isVideoCall;
                    });
                  },
                  child: Image.asset('assets/images/video.png',
                      height: KSize.geHeight(context, 47),
                      width: KSize.getWidth(context, 47)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
