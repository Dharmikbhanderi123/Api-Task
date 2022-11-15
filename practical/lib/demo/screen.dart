// ignore_for_file: sized_box_for_whitespace, avoid_print, non_constant_identifier_names

import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'class.dart';

class homedata extends StatelessWidget {
  const homedata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'demo',
      home: const detailpage(),
    );
  }
}

// ignore: camel_case_types
class detailpage extends StatefulWidget {
  const detailpage({Key? key}) : super(key: key);

  @override
  _detailpageState createState() => _detailpageState();
}

// ignore: camel_case_types
class _detailpageState extends State<detailpage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    readdata();
  }

  readdata() async {
    pref = await SharedPreferences.getInstance();
    Map<String, dynamic> userdetail = jsonDecode(pref.getString('Userdata')!);
    data detail = data.fromJson(userdetail);

    if (userdetail.isNotEmpty) {
      name.value = TextEditingValue(text: detail.name);
      email.value = TextEditingValue(text: detail.email);
      phone.value = TextEditingValue(text: detail.phone);
    }
  }

  savedata() async {
    data detail = data(name.text, email.text, phone.text);
    String Userdata = jsonEncode(detail);
    print(Userdata);
    pref.setString('Userdata', Userdata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Enter Your Information',
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: TextField(
                  controller: name,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Name',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.phone,
                  controller: phone,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    labelText: 'Phone',
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print(name.text);
                  print(email.text);
                  print(phone.text);
                  savedata();
                },
                child: const Text('Save Data')),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  pref.remove('userdata');
                  name.value = const TextEditingValue(text: '');
                  email.value = const TextEditingValue(text: '');
                  phone.value = const TextEditingValue(text: '');
                },
                child: const Text('Submit and Clear Form')),
          ],
        ),
      ),
    );
  }
}
