// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
import 'dart:ui';



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors_constants/colors.dart';
import '../helpers/styles.dart';
import '../helpers/utils.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body, drawer;
  final PreferredSizeWidget? appBar;

  MyScaffold({Key? key, this.body, this.drawer, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar,
      body: body,
      drawer: drawer,
    );
  }
}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final double imageSize;

  const CircularAvatar(
      {Key? key, required this.imagePath, required this.imageSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageSize),
        child: GenericCachedNetworkImage(
          imagePath: imagePath,
        ),
      ),
    );
  }
}

class CustomizedAppBar extends StatelessWidget {
  String title;
  bool isBackRequired;
  final VoidCallback callbackOpenDrawer;

  CustomizedAppBar({
    Key? key,
    this.title = "",
    this.isBackRequired = false,
    required this.callbackOpenDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: appBarColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isBackRequired
                      ? CustomizedTouchEventIconButton(
                          path: 'assets/images/ic_back.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                          callback: () {
                            Navigator.pop(context);
                          })
                      : CustomizedTouchEventIconButton(
                          path: 'assets/images/ic_ham_burger.png',
                          width: 24,
                          height: 24,
                          color: Colors.white,
                          callback: callbackOpenDrawer),
                  CustomizedTouchEventIconButton(
                      path: 'assets/images/ic_emblem.png',
                      width: 24,
                      height: 24,
                      callback: callbackOpenDrawer)
                ],
              ),
              Center(
                  child: Text(
                title,
                style: boldWhiteText18(Colors.white),
              ))
            ],
          ),
        ),
      );
    });
  }
}

class CustomizedTouchEventIconButton extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final VoidCallback callback;
  var color;

  CustomizedTouchEventIconButton(
      {Key? key,
      required this.path,
      required this.width,
      required this.height,
      this.color = null,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        path,
        width: width,
        height: height,
        color: color,
      ),
      onPressed: callback,
    );
  }
}

class GenericCachedNetworkImage extends StatelessWidget {
  final String imagePath;

  const GenericCachedNetworkImage({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      placeholder: (_, url) => PlaceholderWidget(),
      errorWidget: (_, url, error) => PlaceholderWidget(),
      fit: BoxFit.cover,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ic_placeholder.png',
      fit: BoxFit.cover,
    );
  }
}

// ignore: must_be_immutable
class LoadSvgFromAssets extends StatelessWidget {
  String assetName = "";

  LoadSvgFromAssets({
    Key? key,
    required this.assetName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(assetName, semanticsLabel: '');
  }
}

class CustomizedButton extends StatelessWidget {
  final String text;
  final String img;
  final double verticalPadding;
  final Color textColor;

  const CustomizedButton(
      {Key? key,
      required this.text,
      required this.verticalPadding,
      required this.textColor,
      required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isEmpty(img)
                ? Container()
                : Row(
                    children: [
                      Image.asset(
                        img,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
            Text(
              text,
              style: boldWhiteText14(textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class GenericProgressBar extends StatelessWidget {
  const GenericProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: primaryColor,
    );
  }
}
