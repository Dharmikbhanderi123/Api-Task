// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:http/http.dart' as http;
// import 'package:practical/modal.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: HomePage(),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<model> modellists = [];
//   var loading = false;
//   Future<Null> getUserData() async {
//     setState(() {
//       loading = true;
//     });
//     final response =
//         await http.get(Uri.https('jsonplaceholder.typicode.com', 'users'));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         for (Map i in data) {
//           modellists.add(model.fromJson(i));
//         }
//         loading = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     getUserData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Api Call"),
//       ),
//       body: Container(
//         child: loading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 itemCount: modellists.length,
//                 itemBuilder: (context, i) {
//                   final x = modellists[i];
//                   return Container(
//                     padding: EdgeInsets.all(10.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[Text(x.name.toString())],
//                     ),
//                   );
//                 }),
//       ),
//     );
//   }
// }

// ignore_for_file: non_constant_identifier_names, list_remove_unrelated_type
import 'dart:convert';
import 'package:practical/favourite.dart';
import 'package:practical/modal.dart' show model;
import 'package:practical/new.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:favorite_button/favorite_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late SharedPreferences pref;
  List<model> modellists = [];
  List<model> favourite = [];

  Future<List<model>> apidata() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        modellists = (data as List).map((i) => model.fromJson(i)).toList();
      });

      SharedPreferences pref = await SharedPreferences.getInstance();
      favourite = model.decode(jsonDecode(pref.getString('items') ?? ""));

      for (var i = 0; i <= modellists.length; i++) {
        var ind =
            modellists.indexWhere((element) => element.id == favourite[i].id);
        modellists[ind].isFav = true;
      }

      return modellists;
    } else {
      return modellists;
    }
  }

  readtext() async {
    String user = jsonEncode(model.encode(favourite));
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('items', user);
  }

  @override
  void initState() {
    //  savenumber();
    super.initState();
    apidata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Api & Shared Preferences'),
          backgroundColor: Colors.teal[400],
        ),
        body: Column(children: [
          Expanded(
            child: ListView.builder(
              itemCount: modellists.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => personaldata(
                                  data: modellists[index],
                                )));
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: Text(modellists[index].name),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: FavoriteButton(
                        //isFavorite: false,
                        isFavorite: modellists[index].isFav,
                        iconSize: 35,
                        iconColor: Colors.amber[600],
                        iconDisabledColor: Colors.grey[350],
                        valueChanged: (isFavorite) async {
                          // ignore: avoid_print
                          if (isFavorite == true) {
                            setState(() {
                              modellists[index].isFav = isFavorite;
                              // print("object ${modellists[index].isFav}");
                              favourite.add(modellists[index]);
                              print("favourite======${favourite.length}");
                              readtext();
                            });
                          } else if (isFavorite == false) {
                            setState(() {
                              favourite.remove(modellists[index]);
                              print("favourite======${favourite.length}");
                              readtext();
                            });
                          }
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ]));
  }
}

// class ReusbaleRow extends StatelessWidget {
//   String title, value;
//   ReusbaleRow({Key? key, required this.title, required this.value})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(0.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(title),
//           Text(value),
//         ],
//       ),
//     );
//   }
// }

/*zxcvbnlkjhyui*/
//  Future<UserDetails> UserInfo({String sesscode, regno}) async{
// await Future.delayed(Duration(seconds: 1));
// SharedPreferences preferences = await SharedPreferences.getInstance();
//  var map = new Map<String, String>();
// map["sesscode"] = sesscode;
// map["regno"] = regno;

//  var response = await http.post(Base_URL().user_info, body: map);
//  Map decodedata = json.decode(response.body);
//  if(decodedata != null){
//   String user = jsonEncode(UserDetails.fromJson(decodedata));
//   preferences.setString(SharePrefName.infoPref, user);
//   return UserDetails.fromJson(decodedata);
// }
//   return null;
//  }

//  Future<UserDetails> getSavedInfo()async{
//  SharedPreferences preferences = await SharedPreferences.getInstance();
//  Map userMap = jsonDecode(preferences.getString(SharePrefName.infoPref));
//   UserDetails user = UserDetails.fromJson(userMap);
//   return user;
//  }
