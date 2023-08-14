import 'dart:convert';
// import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SharedPreferenceKeys {
  static final String USER = "USER";
  static final String TOKEN = "TOKEN";
  static final String COMPANY_TYPES = "COMPANY_TYPES";

  static final String FNAME = "FNAME";
  static final String LNAME = "LNAME";

  static final String EMAIL = "EMAIL";
  static final String PHONE = "PHONE";
  static final String STATUS = "STATUS";
}

SharedPreferences? globalPrefs;

class SharedPreferenceUtils {
  //----------------  user -----------------


}
