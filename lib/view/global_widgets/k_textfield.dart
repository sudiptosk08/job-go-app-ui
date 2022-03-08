import 'package:application/view/style/k_color.dart';
import 'package:application/view/style/k_size.dart';
import 'package:flutter/material.dart';

class KTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final String image;
  final bool isPasswordField;
  final TextEditingController controller;
  final TextInputType type;

  const KTextField({
    Key key,
    this.hintText,
    this.icon,
    this.image,
    this.isPasswordField = false,
    this.controller,
    this.type,
  }) : super(key: key);

  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: KSize.geHeight(context, 54),
      decoration: BoxDecoration(
          color: KColor.white, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextField(
          keyboardType: widget.type,
          controller: widget.controller,
          obscureText: _obscureText,
          textAlignVertical:
              widget.isPasswordField ? TextAlignVertical.center : null,
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 15)),
                child: Image.asset(
                  widget.image,
                  height: KSize.geHeight(context, 17),
                  width: KSize.getWidth(context, 19),
                  fit: BoxFit.scaleDown,
                  scale: 1.3,
                ),
              ),
              suffixIcon: widget.isPasswordField
                  ? InkWell(
                      onTap: () {
                        _toggle();
                      },
                      child: _obscureText
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 14),
                                  vertical: KSize.geHeight(context, 14)),
                              child: Image.asset(
                                'assets/images/eye.png',
                                height: KSize.geHeight(context, 13),
                                width: KSize.getWidth(context, 16.37),
                                scale: 1.5,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: KSize.getWidth(context, 14),
                                  vertical: KSize.geHeight(context, 14)),
                              child: Image.asset(
                                'assets/images/eye2.png',
                                height: KSize.geHeight(context, 13),
                                width: KSize.getWidth(context, 16.37),
                                fit: BoxFit.scaleDown,
                                scale: 1.5,
                              ),
                            ))
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
              )),
        ),
      ),
    );
  }
}
