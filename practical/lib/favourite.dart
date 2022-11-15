// ignore_for_file: camel_case_types, unused_local_variable, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:practical/modal.dart';
import 'package:shared_preferences/shared_preferences.dart';

class favourite15 extends StatefulWidget {
  const favourite15({Key? key}) : super(key: key);
  @override
  State<favourite15> createState() => _favourite15State();
}

class _favourite15State extends State<favourite15> {
  late SharedPreferences pref;
  List<model> modellists = [];

  readtext() async {
    String user = jsonEncode(model.encode(modellists));
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('items', user);
    //  print("modellists length ${modellists.length}");
    // for (int i = 0; i <= modellists.length; i++) {
    //   print("data print  ${modellists[i].isFav}");
    // }
  }

  savenumber() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      modellists = model.decode(jsonDecode(pref.getString('items') ?? ""));
    });
    return modellists;
  }

  @override
  void initState() {
    super.initState();
    savenumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite Data'),
          centerTitle: true,
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
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: Text(modellists[index].name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: FavoriteButton(
                      isFavorite: modellists[index].isFav,
                      iconSize: 35,
                      iconColor: Colors.amber[600],
                      iconDisabledColor: Colors.grey,
                      valueChanged: (isFavorite) async {
                        setState(() {
                          modellists[index].isFav = isFavorite;
                          print("favorite==>> ${isFavorite}");
                          print("modellist==>> ${modellists[index].isFav}");
                          modellists.removeAt(index);
                          readtext();
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ))
        ]));
  }
}

          /*ListView.builder(
          itemCount: modellists.length,
          itemBuilder: (context, index) {
            return Row(
              children: [ 
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => personaldata()));
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                  ),
                  child: Text(modellists[index].name.toString()),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: FavoriteButton(
                    isFavorite: false,
                    iconSize: 35,
                    iconColor: Colors.amber[600],
                    iconDisabledColor: Colors.grey[350],
                    valueChanged: (_isFavorite) async {
                      // ignore: avoid_print
                      print('Is Favorite : $_isFavorite');
                      if (_isFavorite == true) {
                        // _isFavorite.add(modellists[index]);
                        modellists[index].name;

                        savenumber();
                      } else {
                        {}
                      }
                    },
                  ),
                ),
                // const SizedBox(
                //   height: 55,
                // ),
                // Container(
                //   // padding: const EdgeInsets.symmetric(
                //   //     vertical: 3, horizontal: 5),
                //   color: const Color(0xFF19181A),
                //   height: 2,
                //   width: 426,
                // ),
              ],
            );
          }),*/
        
 // body: ListView.builder(
      //     itemCount: modellists.length,
      //     itemBuilder: (context, i) {
      //       return Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Column(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 TextButton(
      //                   onPressed: () {},
      //                   style: TextButton.styleFrom(
      //                     primary: Colors.black,
      //                   ),
      //                   child: Text(modellists[i].name.toString()),
      //                 ),
      //                 const SizedBox(
      //                   height: 20,
      //                 ),
      //                 Container(
      //                   padding: const EdgeInsets.symmetric(
      //                       vertical: 3, horizontal: 5),
      //                   color: const Color.fromARGB(255, 2, 24, 49),
      //                   height: 2,
      //                   width: 426,
      //                 ),
      //               ]),
      //           // const SizedBox(
      //           //   height: 25,
      //           // ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 12),
      //             child: FavoriteButton(
      //               isFavorite: true,
      //               iconSize: 35,
      //               iconColor: Colors.amber[600],
      //               iconDisabledColor: Colors.grey[350],
      //               valueChanged: (_isFavorite) async {
      //                 // ignore: avoid_print
      //                 print('Is Favorite : $_isFavorite');
      //                 // savenumber();

      //                 if (_isFavorite == true) {
      //                   savenumber();
      //                 }
      //                 if (_isFavorite == false) {
      //                   savenumber();
      //                 }
      //               },
      //             ),
      //           ),
      //         ],
      //       );
      //     }),



      //  if (_isFavorite == true) {
      //                     setState(() {
      //                       modellists[index].isFav = _isFavorite;

      //                       // print("object ${modellists[index].isFav}");
      //                       modellists.add(modellists[index]);
      //                       print("favourite======${modellists.length}");
      //                       readtext();
      //                     });
      //                     // print("favourite======${favourite.length}");
      //                     // //print("favourite======${modellists[index].name}");
      //                     // readtext();
      //                   } else 