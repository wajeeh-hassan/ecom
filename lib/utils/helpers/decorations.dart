import 'package:flutter/material.dart';

import '../colors_constants/colors.dart';

appCounterDecoration(color) => BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    );
var appSeparationLineDecoration = BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey.withOpacity(0.3),
);

// ignore: prefer_const_constructors
var appSeparationDarkLineDecoration = BoxDecoration(
  shape: BoxShape.rectangle,
  color: Colors.grey,
);

rectangularWhiteBoxDecorationWithRadius(double radius) => BoxDecoration(
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(radius),
    color: Colors.white);

rectangularWhiteBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: fieldColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreenBoxDecorationWithRadiusElevation(
        double radius, double elevation) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(radius),
        color: greenColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: elevation,
          ),
        ]);

rectangularGreyBorderDecorationWithRadius(double radius) => BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      border: Border.all(color: textColor),
    );

rectangularAppBarColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
  Color color,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: color);

rectangularOrangeColorBoxDecorationWithRadius(
  double topLeft,
  double bottomLeft,
  double bottomRight,
  double topRight,
) =>
    BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(topLeft),
            bottomLeft: Radius.circular(bottomLeft),
            bottomRight: Radius.circular(bottomRight),
            topRight: Radius.circular(topRight)),
        color: primaryColor);

// var focusFieldDecoration = BoxDecoration(
//     borderRadius: BorderRadius.circular(10.0),
//     shape: BoxShape.rectangle,
//     border: Border.all(color: appBarColor));
//
var unFocusFieldDecoration = BoxDecoration(
  //color: bottomBarColor,
  borderRadius: BorderRadius.circular(10.0),
  shape: BoxShape.rectangle,
);

boxDecorationBottomRounded(Color color, double radius) => BoxDecoration(
    color: color,
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius)));
