import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  static String BASE_URL = 'https://apprml.co.uk';
  static String DATE_FORMAT_STD1 = "yyyy-MM-ddTHH:mm:ss";
  static String DATE_UI_FORMAT = "yyyy-MM-dd";
  static String TIME_UI_FORMAT = "hh:mm:ss aa";
  static String DATE_UI_FORMAT2 = "dd MMM yyyy";
}

class JsonKeys {
  static String check_in = 'checkIns';
  static String check_out = 'checkOuts';
  static String employeeId = 'employeeId';
  static String systemRoleId = 'systemRoleId';
  static String taskId = 'taskId';
  static String projectId = 'projectId';
  static String resourceId = 'resourceId';
  static String time = 'time';
  static String millisFromGMT = 'timeZone';
  static String resources = 'resources';
  static String tasks = 'tasks';
  static String activities = 'activities';
}

String cardImageUrl = 'assets/icons/verified.svg';

//Global variables
// UserModel? globalUserModel = null;
List<Map<String, dynamic>> logs = [];
List<Map<String, dynamic>> allDataModel = [];

// TODO: change it in production
bool isDebugingMode = false;
Function()? gotoNotificationScreen;
Function()? reloadNotificationsDot;
