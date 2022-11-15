//import 'dart:io';

// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'editsetting.dart';

//import 'edit_profile.dart';

// class Myprofile extends StatelessWidget {
//   const Myprofile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Myprofilepage(),
//     );
//   }
// }

class Myprofilepage extends StatefulWidget {
  const Myprofilepage({Key? key}) : super(key: key);

  @override
  State<Myprofilepage> createState() => _MyprofilepageState();
}

class _MyprofilepageState extends State<Myprofilepage> {
  late SharedPreferences sp;
  String? username;
  String? mailid;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  void getdata() async {
    sp = await SharedPreferences.getInstance();
    setState(() {
      username = sp.getString('names')!;
      mailid = sp.getString('mails')!;
    });
  }

  // File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          iconTheme: IconThemeData(color: Color.fromARGB(255, 35, 60, 119)),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 15, right: 50),
              child: Text(
                'My Profile',
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
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Seller ID:',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 181, 183, 184),
                            fontWeight: FontWeight.w800,
                            fontSize: 15)),
                    Text(
                      '  246 890',
                      style: TextStyle(
                          color: Color.fromARGB(255, 35, 60, 119),
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                    )
                  ],
                )),
            // Padding(
            //   padding: EdgeInsets.only(top: 40),
            //   child: Container(
            //     height: 100,
            //     width: 150,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage('image/profile_icon.jpg'),
            //           fit: BoxFit.cover),
            //       shape: BoxShape.circle,
            //     ),
            //   ),
            // ),
            // ClipOval(
            //   child: selectedImage != null
            //       ? Image.file(
            //           selectedImage!,
            //           width: 130,
            //           height: 130,
            //           fit: BoxFit.cover,
            //         )
            //       : Image.asset(
            //           'image/profile_icon.jpg',
            //           width: 130,
            //           height: 130,
            //           fit: BoxFit.cover,
            //         ),
            // ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'bsdbsd$username',
                  style: TextStyle(
                      color: Color.fromARGB(255, 35, 60, 119),
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'sbsdbs$mailid',
                  style: TextStyle(
                      color: Color.fromARGB(255, 181, 183, 184),
                      fontWeight: FontWeight.w800,
                      fontSize: 15),
                )
              ],
            ),
            SizedBox(height: 90),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding: EdgeInsets.only(right: 40, left: 40),
                      height: 45,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 35, 60, 119)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Editprofile(),
                              ),
                            );
                          },
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 17),
                          ))),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
