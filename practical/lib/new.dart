// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:practical/modal.dart';
// import 'home.dart';

class personaldata extends StatefulWidget {
  model data;
  personaldata({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  State<personaldata> createState() => _personaldataState();
}

class _personaldataState extends State<personaldata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.name.toString(),
            style: const TextStyle(fontSize: 20, color: Colors.red)),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Personal Information",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          onTextStyle('ID:' + widget.data.toString()),
          // Text(
          //   'ID:' + widget.name.id.toString(),
          //   style: TextStyle(fontSize: 15),
          // ),
          onTextStyle(
            'Name :' + widget.data.name.toString(),
          ),
          onTextStyle(
            'Username :' + widget.data.username.toString(),
          ),
          onTextStyle(
            'Email :' + widget.data.email.toString(),
          ),
          onTextStyle(
            'Phone :' + widget.data.phone.toString(),
          ),
          onTextStyle(
            'Website :' + widget.data.website.toString(),
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Address',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),

          onTextStyle(
            "street :" + widget.data.address.street.toString(),
          ),
          onTextStyle(
            'Suite :' + widget.data.address.suite.toString(),
          ),
          onTextStyle(
            'City :' + widget.data.address.city.toString(),
          ),
          onTextStyle(
            'Zipcode :' + widget.data.address.zipcode.toString(),
          ),
          onTextStyle(
            'Geo =' + 'Lat :' + widget.data.address.geo.lat.toString(),
          ),
          onTextStyle(
            'Geo =' + 'Lng :' + widget.data.address.geo.lng.toString(),
          ),
          const SizedBox(
            height: 15,
          ),
          const Center(
            child: Text(
              'Company Detail',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          onTextStyle(
            'Name :' + widget.data.company.name.toString(),
          ),
          onTextStyle(
            'CatchPhrase :' + widget.data.company.catchPhrase.toString(),
          ),
          onTextStyle(
            'Bs :' + widget.data.company.bs.toString(),
          ),
        ],
      ),
    );
  }

  onTextStyle(String text) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.normal,
          wordSpacing: 10,
          color: Colors.indigo),
    );
  }
}
