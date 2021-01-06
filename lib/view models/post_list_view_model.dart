

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/models/beans/PostBeans/PostBean.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/UserBean.dart';
import 'package:flutter_app_mvvm/services/webservice.dart';

class PostListViewModel extends ChangeNotifier {

  List<PostBean> users = List<PostBean>();

  Future<void> fetchPosts() async {

    this.users =  await Webservice().fetchPosts();
    notifyListeners();

  }


}