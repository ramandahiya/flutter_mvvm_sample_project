import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;

  final double height;
  final double width;
  final double bottomMargin;
  final double borderWidth;
  final Color buttonColor;

  final TextStyle textStyle = const TextStyle(
      color: const Color(0XFFFFFFFF),
      fontSize: 16.0,
      fontWeight: FontWeight.bold);

  //passing props in react style
  RoundedButton(
      {this.buttonName,
      this.onTap,
      this.height,
      this.bottomMargin,
      this.borderWidth,
      this.width,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    if (borderWidth != 0.0)
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
              color: buttonColor,
              borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
              border: new Border.all(
                  color: const Color.fromRGBO(221, 221, 221, 1.0),
                  width: borderWidth)),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
    else
      return (new InkWell(
        onTap: onTap,
        child: new Container(
          width: width,
          height: height,
          margin: new EdgeInsets.only(bottom: bottomMargin),
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            color: buttonColor,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(buttonName, style: textStyle),
        ),
      ));
  }
}
