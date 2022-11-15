import 'package:flutter/material.dart';
import '../favourite.dart';
import '../home.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'apidata',
      home: homescreen(),
    );
  }
}

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);
  @override
  State<homescreen> createState() => _homescreenState();
}

// ignore: camel_case_types
class _homescreenState extends State<homescreen> {
  int _currentIndex = 0;
  final List<Widget> _widgetlist = [
    const Home(),
    // ignore: avoid_unnecessary_containers
    Container(child: const Text('Details')),
    const favourite15(),
  ];

  void ontapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetlist[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.orange[800]),
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.deepOrangeAccent),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal[400],
        fixedColor: Colors.white,
        onTap: ontapped,
        currentIndex: _currentIndex,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.description_sharp), label: "Details"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourite"),
        ],
      ),
    );
  }
}
