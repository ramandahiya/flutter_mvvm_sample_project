import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_mvvm/theme/style.dart';
import 'package:flutter_app_mvvm/ui/login/validations.dart';
import 'package:flutter_app_mvvm/util/UtilMethod.dart';
import 'package:flutter_app_mvvm/util/components/Buttons/roundedButton.dart';
import 'package:flutter_app_mvvm/util/delayed_animation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'style.dart';
import 'package:flutter_app_mvvm/util/components/TextFields/inputField.dart';

class LoginScreen extends StatefulWidget {
  //const LoginScreen({Key key}) : super(key: key);

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  BuildContext context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController scrollController = new ScrollController();
  final int delayedAmount = 500;

  bool autovalidate = false;

  SpinKitPouringHourglass spinkit;

  InputField PasswordInputField,EmailInputField;
  String passwordString="", emailString="" ;

  _onPressed() {
    print("button clicked");
  }

  onPressed(String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _handleSubmitted() {


   try {
     final FormState form = formKey.currentState;
     if (!form.validate()) {
       autovalidate = true; // Start validating on every change.
       showInSnackBar('Please fix the errors in red before submitting.');
     } else {
       form.save();
       UtilMethod.storeSharedPreferences("username", emailString);
       UtilMethod.storeSharedPreferences("password" , passwordString );
       // userAuth.verifyUser(user).then((onValue) {
       var onValue = "Login Successfull";
       if (onValue == "Login Successfull")
         Navigator.pushNamed(context, "/HomePage");
       else
         showInSnackBar(onValue);
     }


   }catch( onError) {
        showInSnackBar(onError.message);
      }


   showLoader();
  }

  bool _isVisible = true;

  void showLoader() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    this.context = context;
    final Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    Validations validations = new Validations();
    return new Scaffold(
        key: _scaffoldKey,
        body: Center(
            child: new SingleChildScrollView(
                controller: scrollController,

                  child: new Column(

                    children: <Widget>[

                      AvatarGlow(
                        endRadius: 90,
                        duration: Duration(seconds: 2),
                        glowColor: Colors.blue,
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

                      // new Container(
                      //
                      //   height: screenSize.height / 2,
                      //   child: new Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       new Center(
                      //           child: new Image(
                      //         image: logo,
                      //         width: (screenSize.width < 500)
                      //             ? 120.0
                      //             : (screenSize.width / 4) + 12.0,
                      //         height: screenSize.height / 4 + 20,
                      //       ))
                      //     ],
                      //   ),
                      // ),

                      Visibility(
                        visible: _isVisible,
                        child: spinkit = SpinKitPouringHourglass(
                          color: Colors.blue,
                          size: 50.0,
                        ),
                      ),

                      DelayedAnimation(
                        child: new Container(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Form(
                                key: formKey,
                                autovalidate: autovalidate,
                                child: new Column(
                                  children: <Widget>[
                                    EmailInputField =  new InputField(
                                        hintText: "Email",
                                        obscureText: false,
                                        textInputType: TextInputType.text,
                                        textStyle: textStyle,
                                        textFieldColor: textFieldColor,
                                        icon: Icons.mail_outline,
                                        iconColor: Colors.blue,
                                        bottomMargin: 20.0,
                                        validateFunction:
                                            validations.validateEmail,
                                        onSaved: (String email) {
                                           emailString = email;
                                        }),
                                    PasswordInputField = new InputField(
                                        hintText: "Password",
                                        obscureText: true,
                                        textInputType: TextInputType.text,
                                        textStyle: textStyle,
                                        textFieldColor: textFieldColor,
                                        icon: Icons.lock_open,
                                        iconColor: Colors.blue,
                                        bottomMargin: 30.0,
                                        validateFunction:
                                            validations.validatePassword,
                                        onSaved: (String password) {
                                          passwordString = password;
                                        }),
                                    new RoundedButton(
                                      buttonName: "Get Started",
                                      onTap: _handleSubmitted,
                                      width: screenSize.width,
                                      height: 50.0,
                                      bottomMargin: 10.0,
                                      borderWidth: 0.0,
                                      buttonColor: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              // new Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: <Widget>[
                              //     new TextButton(buttonName: "Create Account",
                              //         onPressed: () => onPressed(),
                              //         buttonTextStyle: buttonTextStyle),
                              //
                              //   ],
                              // )
                            ],
                          ),
                        ),
                        delay: delayedAmount + 1000,
                      ),
                    ],
                  ),
                )));
  }
}
