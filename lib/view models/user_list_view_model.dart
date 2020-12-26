

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/UserBean.dart';
import 'package:flutter_app_mvvm/services/webservice.dart';

class UserListViewModel extends ChangeNotifier {

  List<UserBean> users = List<UserBean>();

  Future<void> fetchUsers() async {

    this.users =  await Webservice().fetchUsers();
    notifyListeners();

  }


}