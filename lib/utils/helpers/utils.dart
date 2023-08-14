import 'dart:async';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom/utils/helpers/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../colors_constants/colors.dart';
import '../constants.dart';
import '../routes/routes.dart';
import '../constants.dart';
import '../sheredPref/shared_preference_utils.dart';
import 'dialogs.dart';

// void showToast(String content) {
//   Fluttertoast.showToast(
//       msg: "   $content   ",
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.TOP,
//       timeInSecForIosWeb: 2,
//       backgroundColor: Colors.black.withOpacity(0.6),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

void showToast(String message) {
  Fluttertoast.showToast(
      msg: "   $message   ",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: primaryColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

void showMessage(String message, BuildContext context) {
  var fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    height: 50,
    width: getScreenSize(context).width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(0.0),
      color: primaryColor,
    ),
    child: Center(
      child: Text(
        message,
        style: regularWhiteText16(whiteColor),
      ),
    ),
  );

  fToast.showToast(
      child: SafeArea(child: toast),
      toastDuration: Duration(seconds: 3),
      fadeDuration: Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: 0.0,
        );
      });
}

Future<bool> connectivityCheck() async {
  bool connect = false;

  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    // I am connected to a mobile network.
    connect = true;
    return connect;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    // I am connected to a wifi network.
    connect = true;
    return connect;
  } else {
    showToast("No Internet");
    return connect;
  }
}

bool isNotEmpty(value) {
  if (value != null && value != '') {
    return true;
  }
  return false;
}

bool isEmpty(value) {
  if (value == null || value == '') {
    return true;
  }
  return false;
}

bool isValidEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(p);
  return regExp.hasMatch(em);
}



String formatHHMMSS(int seconds) {
  if (seconds != null && seconds != 0) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "${hoursStr}h:${minutesStr}m:${secondsStr}s";
  } else {
    return "00h:00m:00s";
  }
}

Widget buildTimerIndication(int? projectId, [int? employeeId]) {
  int length;
  if (isEmpty(employeeId)) {
    length = logs
        .where((element) =>
            ((element[JsonKeys.check_in][JsonKeys.projectId]) == projectId) &&
            isEmpty(element[JsonKeys.check_out]))
        .toList()
        .length;
  } else {
    length = logs
        .where((element) =>
            ((element[JsonKeys.check_in][JsonKeys.projectId]) == projectId) &&
            ((element[JsonKeys.check_in][JsonKeys.employeeId]) == employeeId) &&
            isEmpty(element[JsonKeys.check_out]))
        .toList()
        .length;
  }

  return length > 0
      ? Image.asset(
          'assets/images/ic_clock.png',
          height: 24,
        )
      : Container();
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

showSnackBar(String messgage, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      messgage,
      softWrap: true,
      maxLines: 2,
    ),
    action: SnackBarAction(
      onPressed: () {},
      label: "",
    ),
  ));
}

showBanner(String messgage, BuildContext context) {
  ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
      content: Center(child: Text(messgage)),
      backgroundColor: primaryColor,
      contentTextStyle: regularWhiteText16(whiteColor),
      leadingPadding: const EdgeInsets.only(right: 30),
      leading: const Icon(
        Icons.info,
        size: 32,
        color: Colors.white,
      ),
      actions: [
        TextButton(
            onPressed: () {},
            child: Text(
              'Dismiss',
              style: mediumWhiteText16(blackTextColor),
            )),
      ]));

  Future.delayed(const Duration(milliseconds: 2000), () {
    ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
  });
}



void showLoader(BuildContext context, bool show) {
  if (show) {
    Loader.hide();
    Loader.show(context,
        progressIndicator: CircularProgressIndicator(
            backgroundColor: primaryColor, color: blackBackoundColor));
    Timer(Duration(seconds: 30), () {
      Loader.hide();
    });
  }
}

void hideLoader(BuildContext context) {
  Loader.hide();
}

String getInitials(String bankAccountName) => bankAccountName.isNotEmpty
    ? bankAccountName.trim().split(RegExp(' +')).map((s) => s[0]).take(2).join()
    : '';

extension DateTimeX on DateTime {
  bool isUnderage() =>
      (DateTime(DateTime.now().year, this.month, this.day)
              .isAfter(DateTime.now())
          ? DateTime.now().year - this.year - 1
          : DateTime.now().year - this.year) <
      18;
}

