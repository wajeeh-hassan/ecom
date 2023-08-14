import 'package:ecom/utils/helpers/styles.dart';
import 'package:ecom/utils/helpers/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../colors_constants/colors.dart';

showFullWidthDialog(BuildContext context, Widget child, isCancelable){
  showDialog(
    barrierDismissible: isCancelable,
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: child,
    ),
  );
}

showUserErrorDialouge(BuildContext context , String message){
  showFullWidthDialog(
      context,
      Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: whiteColor,
          ),
          height: 300,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [

              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  iconSize: 30,
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () {
                    // Navigator.relo; // Dismisses dialog
                    //   logout(context);
                  },
                ),
              ),

              Center(
                child: Container(
                  height: 60,
                  width: getScreenSize(context).width * 0.4,
                  child: Image.asset(
                    'assets/images/verification.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    message ,
                    style: regularWhiteText16(blackTextColor),
                  ),
                ),
              ),
            ],
          )),
      false);
}