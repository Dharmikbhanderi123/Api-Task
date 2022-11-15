import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:flutter_application_2/myprofile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginsetting.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);

  @override
  State<Editprofile> createState() => EditprofileState();
}

class EditprofileState extends State<Editprofile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  late SharedPreferences sp;
  // String? fullname;
  // String? emailId;

  // void getdata() async {
  //   sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     fullname = sp.getString('name');
  //     emailId = sp.getString('email');
  //   });
  // }

  File? selectedImage;
  String base64Image = "";
  Future<void> chooseImage(type) async {
    var image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
    } else if (type == "Gallery") {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
        base64Image = base64Encode(selectedImage!.readAsBytesSync());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setdata();
  }

  void setdata() async {
    sp = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 35, 60, 119)),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 15, right: 50),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 35, 60, 119)),
              ),
            ),
          ),
          toolbarHeight: 100,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 181, 183, 184),
              Color.fromARGB(29, 238, 234, 234)
            ],
          ))),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipOval(
                      child: selectedImage != null
                          ? Image.file(
                              selectedImage!,
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'image/profile_icon.jpg',
                              width: 130,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Color.fromARGB(255, 233, 231, 231)),
                        child: IconButton(
                          onPressed: () {
                            chooseImage("Gallery");
                            chooseImage("camera");
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.grey,
                            size: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: namecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 225, 230, 230))),
                        label: Text('Full Name'),
                        hintText: 'Enter Name'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 225, 230, 230))),
                      border: OutlineInputBorder(),
                      label: Text('Email Id'),
                      hintText: "Enter Email",
                    ),
                  ),
                ),
                SizedBox(height: 99),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 35, 60, 119)),
                    onPressed: () {
                      String names = namecontroller.text;
                      String mails = emailcontroller.text;
                      if (names != '' && mails != '') {
                        sp.setString('names', names);
                        sp.setString('mails', mails);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Myprofilepage()),
                        );
                      }
                    },
                    child: Text(
                      'Save Change',
                      style: TextStyle(fontSize: 17),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
