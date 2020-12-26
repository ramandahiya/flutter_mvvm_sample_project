import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_mvvm/ui/images_page.dart';
import 'package:flutter_app_mvvm/ui/post_page.dart';
import 'package:flutter_app_mvvm/view%20models/user_list_view_model.dart';
import 'package:flutter_app_mvvm/ui/post_page.dart';
import 'users_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;

  final _pageOptions = [
    Users(), Posts(), Images()];

  var v1 =
      BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('USERS'));

  var v2 = BottomNavigationBarItem(
      icon: Icon(Icons.local_post_office), title: Text('POSTS'));

  var v3 =
      BottomNavigationBarItem(icon: Icon(Icons.image), title: Text('IMAGES'));

  var v4 = BottomNavigationBarItem(
      icon: Icon(Icons.comment), title: Text('COMMENTS'));

  @override
  Widget build(BuildContext context) {

     return Scaffold(
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          elevation: 2,
          items: <BottomNavigationBarItem>[v1, v2, v3],
        )
     );

  }


}
