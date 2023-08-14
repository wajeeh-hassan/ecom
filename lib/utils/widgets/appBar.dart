import 'dart:ui';

import 'package:flutter/material.dart';

import '../colors_constants/colors.dart';
import '../helpers/styles.dart';

//---------------------- app bar -----------------------------
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: whiteColor,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                    width: 28,
                    height: 28,
                    child: Image.asset('assets/images/menu.png'))),
          ),
          Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Portfolio",
                  style: mediumWhiteText19(blackTextColor),
                ),
              )),
          Expanded(
            flex: 1,
            child: Container(
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                      width: 28,
                      height: 28,
                      child: Image.asset('assets/images/notification.png'))),
            ),
          ),
        ],
      ),
    );
  }
}
