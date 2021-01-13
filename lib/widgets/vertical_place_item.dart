import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/UserBean.dart';
import 'package:flutter_app_mvvm/ui/screens/details.dart';

// import '../screens/details.dart';

class VerticalPlaceItem extends StatelessWidget {
  final UserBean item;

  VerticalPlaceItem({this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: InkWell(
        child: Container(
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  "${""}",
                  height: 0.0,
                  width: 0.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15.0),
              Container(
                height: 90.0,
                width: MediaQuery.of(context).size.width - 130.0,
                child: ListView(
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${item.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.0,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 3.0),

                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          size: 13.0,
                          color: Colors.blueGrey[300],
                        ),
                        SizedBox(width: 3.0),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${item.email}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13.0,
                              color: Colors.blueGrey[300],
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "${item.website}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[600],
                          fontSize: 12.0,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return Details();
              },
            ),
          );

        },
      ),
    );
  }
}
