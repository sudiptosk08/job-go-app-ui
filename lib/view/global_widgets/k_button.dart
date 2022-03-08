import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:application/view/style/k_textStyle.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class KButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;

  const KButton({
    Key key,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: KSize.geHeight(context, 54),
        width: context.screenWidth,
        decoration: BoxDecoration(
            color: KColor.primary, borderRadius: BorderRadius.circular(16)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: KColor.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              )),
          onPressed: onPressed,
          child: Text(buttonText, style: KTextStyle.bodyText),
          //color: Color(0xff00CC96),
        ));
  }
}
