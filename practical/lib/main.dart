// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:practical/demo/homescreen.dart';
// import 'package:practical/home.dart';
// // import 'home.dart';

// void main() {
//   runApp(MyApp());
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double n1, n2, op = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              'Simple Calculator',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                CustomTextField(
                    hint: '1st Number',
                    onChanged: (s) {
                      n1 = double.parse(s);
                      print(n1);
                    }),
                SizedBox(width: 10),
                CustomTextField(
                    hint: '2nd Number',
                    onChanged: (s) {
                      n2 = double.parse(s);
                      print(n2);
                    })
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    symbol: '+',
                    onTap: () {
                      setState(() {
                        op = (n1 + n2);
                      });
                    }),
                CustomButton(
                    symbol: '-',
                    onTap: () {
                      setState(() {
                        op = (n1 - n2);
                      });
                    }),
                CustomButton(
                    symbol: '×',
                    onTap: () {
                      setState(() {
                        op = (n1 * n2);
                      });
                    }),
                CustomButton(
                    symbol: '÷',
                    onTap: () {
                      setState(() {
                        if (n2 == 0)
                          op = -1;
                        else
                          op = (n1 / n2).toDouble();
                      });
                    }),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Output',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(18)),
              child: Center(
                child: Text(
                  op.toStringAsFixed(2),
                  style: TextStyle(fontSize: 24),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.onChanged, required this.hint})
      : super(key: key);

  final Function(String) onChanged;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onChanged: onChanged,
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            filled: true,
            fillColor: Colors.black12,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(18)),
            hintText: hint,
            helperText: 'Keep it Short'),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onTap, required this.symbol})
      : super(key: key);

  final String symbol;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            symbol,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
