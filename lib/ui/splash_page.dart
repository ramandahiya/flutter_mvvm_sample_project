import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/ui/images_page.dart';
import 'package:flutter_app_mvvm/ui/login/index.dart';
import 'package:flutter_app_mvvm/ui/post_page.dart';
import 'package:flutter_app_mvvm/ui/screens/main_screen.dart';
import 'package:flutter_app_mvvm/util/UtilMethod.dart';
import 'package:flutter_app_mvvm/util/const.dart';

import 'users_page.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app_mvvm/ui/home_page.dart';
import 'package:flutter_app_mvvm/util/delayed_animation.dart';
import 'package:avatar_glow/avatar_glow.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

  TextField searchTextField2;
  final TextEditingController _textcontroller = TextEditingController();
  Text searchTextField;

  @override
  void initState() {

    _loader();

    _Notification();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
      setState(() {});
    });

    _timerState();

    _textcontroller.addListener(_printLatestValue);

    super.initState();

  }

  _printLatestValue() async {
    print("Second text field: ${_textcontroller.text}");
    // await Fluttertoast.showToast(
    //     msg: "Wait Fetching Details ${_textcontroller.text}",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIos: 1,
    //     backgroundColor: Colors.black54,
    //     textColor: Colors.blueGrey,
    //     fontSize: 16.0
    // );

  }

  Timer _timer;

  _timerState() {
    _timer = new Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        if(UtilMethod.getLoggedInStatus("username") == "12345")
        {

          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => HomePage()
          ));

        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.blueGrey;
    _scale = 1 - _controller.value;

    return   Builder(

           builder: (context) =>  Scaffold(

              backgroundColor: Constants.lightPrimary,

              body: Center(

                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    AvatarGlow(
                      endRadius: 90,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.blueGrey,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 2),
                      startDelay: Duration(seconds: 1),
                      child: Material(
                          elevation: 8.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            child: FlutterLogo(
                              size: 50.0,
                            ),
                            radius: 50.0,
                          )),
                    ),
                    DelayedAnimation(
                      child: searchTextField =Text(
                        "Triad Technologies",
                         style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: color),

                      ),

                      delay: delayedAmount + 1000,
                    ),


                    FlatButton.icon(
                      textColor: Colors.blueGrey,
                      onPressed: () {

                       // String s= searchTextField.data;
                      // searchTextField2.controller.value= s as TextEditingValue;
                        Navigator.pushReplacement(context, new MaterialPageRoute(
                            builder: (context) => MainScreen()


                        ));

                        //Navigator.of(context).pushNamed('/homepage');

                        //Navigator.pushNamed(context, HomePage.routeName);
                        // Navigator.push(context,MaterialPageRoute(builder: (context){return HomePage();}));
                      },
                      icon: Icon(Icons.home),
                      label: Text('Continue'),

                    ),

                    FlatButton.icon(
                      textColor: Colors.blueGrey,
                      onPressed: () {

                        // String s= searchTextField.data;
                        // searchTextField2.controller.value= s as TextEditingValue;
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => LoginScreen()
                        ));

                        //Navigator.of(context).pushNamed('/homepage');

                        //Navigator.pushNamed(context, HomePage.routeName);
                        // Navigator.push(context,MaterialPageRoute(builder: (context){return HomePage();}));
                      },
                      icon: Icon(Icons.account_balance_wallet),
                      label: Text('Login'),

                    ),


                  ],
                ),
              )


            // ),
          ),

        );

  }

  Widget get _animatedButtonUI => Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.blueGrey,
    ),
    child: Center(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8185E2),
        ),
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    // Navigator.push(context, new MaterialPageRoute(
    //     builder: (context) => HomePage()
    // ));

    // Navigator.push(context,MaterialPageRoute(builder: (context){return HomePage();

    // MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: new ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: new HomePage(),
    // );


  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _textcontroller.dispose();
    super.dispose();
  }



  void _Notification() {

    var initializationSettingsAndroid = new AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message ${message}');
        // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
        displayNotification(message);
        // _showItemDialog(message);
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
    });

  }

  Future displayNotification(Map<String, dynamic> message) async{
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'channelid', 'flutterfcm', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: 'hello',);
  }


  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Fluttertoast.showToast(
        msg: "Notification Clicked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.blueGrey,
        fontSize: 16.0
    );
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new Splash()),
    );
  }

  Future onDidRecieveLocalNotification(

      int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Fluttertoast.showToast(
                  msg: "Notification Clicked",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.blueGrey,
                  fontSize: 16.0
              );
            },
          ),
        ],
      ),
    );
  }


}

void _loader() {

}
