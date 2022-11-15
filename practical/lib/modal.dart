import 'dart:convert';
// import 'package:meta/meta.dart';

class model {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;
  bool isFav = false;

  model(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company,
      this.isFav = false});

  factory model.fromJson(Map<String, dynamic> json) => model(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']),
        isFav: json['isFav'] ?? false,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    // ignore: unnecessary_null_comparison
    if (address != null) {
      data['address'] = address.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    // ignore: unnecessary_null_comparison
    if (company != null) {
      data['company'] = company.toJson();
    }
    data['isFav'] = isFav;
    return data;
  }

  // static Map<String, dynamic> toMap(model userData) => {
  //       'id': userData.id,
  //       'name': userData.name,
  //       'username': userData.username,
  //       'email': userData.email,
  //       'address': userData.address,
  //       'phone': userData.phone,
  //       'website': userData.website,
  //       'company': userData.company,
  //       'isFav': userData.isFav,
  //     };

  static String encode(List<model> modellists) => json.encode(
        modellists
            .map<Map<String, dynamic>>((userData) => userData.toJson())
            .toList(),
      );

  static List<model> decode(String modellists) =>
      (json.decode(modellists) as List<dynamic>)
          .map<model>((item) => model.fromJson(item))
          .toList();
}

class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo']),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['suite'] = suite;
    data['city'] = city;
    data['zipcode'] = zipcode;
    if (geo != null) {
      data['geo'] = geo.toJson();
    }
    return data;
  }

  // static Map<String, dynamic> toMap(Address userData) => {
  //       'street': userData.street,
  //       'suite': userData.suite,
  //       'city': userData.city,
  //       'zipcode': userData.zipcode,
  //       'geo': userData.geo,
  //     };
}

class Geo {
  String lat;
  String lng;
  Geo({required this.lat, required this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }

  // static Map<String, dynamic> toMap(Geo userData) => {
  //       'lat': userData.lat,
  //       'lng': userData.lng,
  //     };
}

class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['catchPhrase'] = catchPhrase;
    data['bs'] = bs;
    return data;
  }

  // static Map<String, dynamic> toMap(Company userData) => {
  //       'name': userData.name,
  //       'catchPhrase': userData.catchPhrase,
  //       'bs': userData.bs,
  //     };
}
