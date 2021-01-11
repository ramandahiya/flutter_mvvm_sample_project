import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/util/const.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:ui';
import 'dart:io';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File myImage;

  // Function to open a camera
  Future openCamera() async {
    var cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      myImage = cameraImage;
    });
  }

  // Function to open a local gallery
  Future openGalley() async {
    var galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      myImage = galleryImage;
    });
  }

  // Function to show dialog box
  Future<void> openDialogBox() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(),
          backgroundColor: Constants.blueGrey,
          title: Text(
            'Choose options',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                MaterialButton(
                  color: Constants.lightAccent,
                  child: Text(
                    "Open Camera",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openCamera();
                  },
                ),
                MaterialButton(
                  color: Constants.lightAccent,
                  child: Text(
                    "Open Galley",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    openGalley();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera App"),
      ),
      body: Container(
        child: myImage == null
            ? Center(
                child: Text(
                "No image selected",
                style: TextStyle(
                  fontSize: 20,
                ),
              ))
            : Image.file(myImage),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialogBox();
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
