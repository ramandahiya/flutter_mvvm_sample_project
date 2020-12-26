import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/ui/images_page.dart';
import 'package:flutter_app_mvvm/ui/post_page.dart';

import 'users_page.dart';


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

  @override
  void initState() {
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    _scale = 1 - _controller.value;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(

          builder: (context) =>  Scaffold(

              backgroundColor: Color(0xFF8185E2),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    AvatarGlow(
                      endRadius: 90,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.white24,
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
                      child: Text(
                        "Triad Technologies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: color),
                      ),

                      delay: delayedAmount + 1000,
                    ),

                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    // DelayedAnimation(
                    //   child: Text(
                    //     "Your New Personal",
                    //     style: TextStyle(fontSize: 20.0, color: color),
                    //   ),
                    //   delay: delayedAmount + 3000,
                    // ),
                    FlatButton.icon(
                      textColor: Colors.white,
                      onPressed: () {

                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => HomePage()
                        ));

                        //Navigator.of(context).pushNamed('/homepage');

                        //Navigator.pushNamed(context, HomePage.routeName);
                        // Navigator.push(context,MaterialPageRoute(builder: (context){return HomePage();}));
                      },
                      icon: Icon(Icons.account_balance_wallet),
                      label: Text('Continue'),

                    ),

                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    // DelayedAnimation(
                    //   child: GestureDetector(
                    //     onTapDown: _onTapDown,
                    //     onTapUp: _onTapUp,
                    //     child: Transform.scale(
                    //       scale: _scale,
                    //       child: _animatedButtonUI,
                    //     ),
                    //   ),
                    //   delay: delayedAmount + 4000,
                    // ),
                    // SizedBox(height: 30.0,),
                    //  DelayedAnimation(
                    //    child: Text(
                    //      "I Already have An Account".toUpperCase(),
                    //      style: TextStyle(
                    //          fontSize: 20.0,
                    //          fontWeight: FontWeight.bold,
                    //          color: color),
                    //    ),
                    //    delay: delayedAmount + 5000,
                    //  ),
                  ],
                ),
              )


            // ),
          ),
          // routes: <String, WidgetBuilder>{
          //   '/homepage': (BuildContext context) => new HomePage(),
          //  },
        )
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 60,
    width: 270,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100.0),
      color: Colors.white,
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


}
