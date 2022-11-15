import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'loginsetting.dart';

//import 'myprofile.dart';

class Screen1 extends StatelessWidget {
  // const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1page(),
    );
  }
}

class Screen1page extends StatefulWidget {
  // const Screen1page({super.key});

  @override
  State<Screen1page> createState() => _Screen1pageState();
}

class _Screen1pageState extends State<Screen1page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Settings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color.fromARGB(255, 35, 60, 119)),
            ),
          ),
        ),
        toolbarHeight: 100,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 181, 183, 184),
            Color.fromARGB(29, 238, 234, 234)
          ],
        ))),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: Container(
              height: 60,
              child: TextButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myprofilepage()));
                  }),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'My Profile',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
            ),
            child: Container(
              height: 60,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Receipt settings',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Container(
              height: 60,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Lottery Number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Container(
              height: 60,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Award Number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Container(
              height: 60,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount Statistical',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Container(
              height: 60,
              child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xFFF5F6F9)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Language setting',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 35, 60, 119)),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Color.fromARGB(255, 35, 60, 119),
                      )
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 5,
            ),
            child: Container(
              height: 60,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 246, 239, 239)),
                  onPressed: (() {}),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Log Out',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Color.fromARGB(255, 233, 93, 93)),
                      ),
                      Icon(
                        Icons.exit_to_app,
                        color: Color.fromARGB(255, 233, 93, 93),
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
