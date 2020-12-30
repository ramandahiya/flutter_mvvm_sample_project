

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_mvvm/view%20models/user_list_view_model.dart';

class Users extends StatefulWidget {

  @override
  _UsersState createState() => _UsersState();

}

class _UsersState extends State<Users> {

  //  List<UserBean> _data;

  //  Future<String> getUsers() async {
  //   var response =
  //       await http.get(APIS.usersList, headers: {"Accept": "application/json"});
  //
  //   setState(() {
  //     List res = json.decode(response.body);
  //     _data = res.map((data) => UserBean.fromJsonMap(data)).toList();
  //   });
  //   return "success";
  // }


  UserListViewModel vm;
  @override
  void initState() {
    super.initState();

    //vm = Provider.of<MovieListViewModel>(context);

  }



  @override
  Widget build(BuildContext context) {

    vm = Provider.of<UserListViewModel>(context);

    vm.fetchUsers();

    return Scaffold(
        appBar: AppBar(
          title: Text('USERS'),
        ),
        body:

             ListView.builder(
                   itemCount: vm.users == null ? 0 : vm.users.length,
                   itemBuilder: (context, index) {

                      final item = vm.users[index];

                      return
                        Column(
                          children: <Widget>[


                                ListTile(
                                  leading: CircleAvatar(backgroundColor: Colors.cyan,),
                                  title: Text(item.name),
                                  subtitle: Text(item.username),
                                   isThreeLine: true,
                                  trailing: Text(item.website),
                        ),


                             Divider()

                     ],
                        );

                  }

               )




    );
  }
}
