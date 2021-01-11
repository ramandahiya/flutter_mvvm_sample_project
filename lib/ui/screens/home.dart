import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/models/beans/PostBeans/PostBean.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/UserBean.dart';
import 'package:flutter_app_mvvm/ui/camera/CameraPage.dart';
import 'package:flutter_app_mvvm/util/const.dart';
import 'package:flutter_app_mvvm/util/places.dart';
import 'package:flutter_app_mvvm/view%20models/post_list_view_model.dart';
import 'package:flutter_app_mvvm/view%20models/user_list_view_model.dart';
import 'package:flutter_app_mvvm/widgets/horizontal_place_item.dart';
import 'package:flutter_app_mvvm/widgets/icon_badge.dart';
import 'package:flutter_app_mvvm/widgets/search_bar.dart';
import 'package:flutter_app_mvvm/widgets/vertical_place_item.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {

  UserListViewModel vm_user;
  PostListViewModel vm_post;

  @override
  Widget build(BuildContext context) {

    vm_user = Provider.of<UserListViewModel>(context);

    vm_user.fetchUsers();

    vm_post = Provider.of<PostListViewModel>(context);

    vm_post.fetchPosts();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: new Container(
          child: new Text("Home"),
          ),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) => CameraPage()
              ));
            },
          ),
        ],
      ),
      body:

      ListView(
        physics: const AlwaysScrollableScrollPhysics (),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Where are you \ngoing?",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),

          buildHorizontalList(context),
          Divider(),
          SizedBox(height: 3.0),

          buildVerticalList(),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context) {
    return Container(color: Constants.blueGrey,
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 80.0,
      width: MediaQuery.of(context).size.width,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: vm_post.users == null ? 0.0 : vm_post.users.length,
        itemBuilder: (BuildContext context, int index) {
          PostBean place = vm_post.users[index];
          return HorizontalPlaceItem(place: place);
        },
      ),


    );
  }

  buildVerticalList() {
    return Padding(
      padding: EdgeInsets.all(20.0),

      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: vm_user.users == null ? 0 : vm_user.users.length,
        itemBuilder: (BuildContext context, int index) {
          UserBean place = vm_user.users[index];
          return VerticalPlaceItem(item: place);
        },
      ),


    );
  }
}
