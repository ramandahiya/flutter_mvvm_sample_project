import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app_mvvm/ui/paypal/colors.dart';
import 'package:flutter_app_mvvm/ui/paypal/activity.dart';
import 'package:flutter_app_mvvm/ui/paypal/sendmoney.dart';
import 'package:flutter_app_mvvm/ui/paypal/custom_box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.all(0),
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: colorPrimaryDark.withOpacity(0.5),
                  blurRadius: 40,
                  spreadRadius: -20,
                  offset: Offset(0, 16),
                ),
              ],
            ),
            child: Stack(
              children: [
                Container(
                  width: size.width,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        colorPrimaryGradient,
                        colorPrimaryDark,
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  left: -50,
                  width: 400,
                  height: 420,
                  child: Opacity(
                    opacity: 0.75,
                    child:
                        SvgPicture.asset('assets/images/paypal_backlogo.svg'),
                  ),
                ),
                Container(
                  width: size.width,
                  height: 320,
                  padding: EdgeInsets.only(top: 72, left: 32, right: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(

                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.topCenter,
                                image: AssetImage('assets/images/logo.png'),
                              ),
                            ),
                          ),  Container(
                            width: 82,
                            height: 82,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: colorPrimaryGradient,
                                width: 2,
                              ),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                alignment: FractionalOffset.topCenter,
                                image: AssetImage('assets/images/avatar.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Hello, Vadim!',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorWhite.withOpacity(0.5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                          '\$ 272.30',
                          style: GoogleFonts.manrope(
                            fontSize: 35,
                            fontWeight: FontWeight.w600,
                            color: colorWhite,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Text(
                          'Your Balance',
                          style: GoogleFonts.manrope(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: colorWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorPrimaryDark.withOpacity(0.5),
                        blurRadius: 50,
                        spreadRadius: -20,
                        offset: Offset(0, 24),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        colorPrimaryGradient,
                        colorPrimaryDark,
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SendMoneyPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/upload.svg'),
                          Text(
                            'Send Money',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: colorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 110,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: colorPrimaryDark.withOpacity(0.5),
                        blurRadius: 50,
                        spreadRadius: -20,
                        offset: Offset(0, 24),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        colorPrimaryGradient,
                        colorPrimaryDark,
                      ],
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SendMoneyPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset('assets/icons/upload.svg'),
                          Text(
                            'Send Money',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: colorWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 5, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Activity',
                  style: GoogleFonts.manrope(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: colorBlack,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ActivityPage(),
                      ),
                    );
                  },
                  child: Text(
                    'View all',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: colorBlack.withOpacity(0.5),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 24, left: 5, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomBox(
                  label: 'Mike Rine',
                  text: '2 hours ago',
                  onRightArea: Text(
                    '+\$250',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorGreen,
                    ),
                  ),
                ),
                CustomBox(
                  label: 'Google Drive',
                  text: 'Yesterday',
                  onLeftArea: SvgPicture.asset(
                    'assets/icons/google_drive.svg',
                    color: colorBlack,
                  ),
                  onRightArea: Text(
                    '-\$138.5',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorRed,
                    ),
                  ),
                ),
                CustomBox(
                  label: 'Casey Smith',
                  text: '1 week ago',
                  onRightArea: Text(
                    '+\$531',
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorGreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
