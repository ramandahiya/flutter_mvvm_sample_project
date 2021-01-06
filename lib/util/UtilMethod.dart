import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UtilMethod {

 static void storeSharedPreferences(String key,String value ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  // Gets the logged in status
  static Future<String> getLoggedInStatus(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(key) ?? false;
  }

}