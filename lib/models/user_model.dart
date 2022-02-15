/*
{
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
        "street": "Kulas Light",
        "suite": "Apt. 556",
        "city": "Gwenborough",
        "zipcode": "92998-3874",
        "geo": {
            "lat": "-37.3159",
            "lng": "81.1496"
        }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
        "name": "Romaguera-Crona",
        "catchPhrase": "Multi-layered client-server neural-net",
        "bs": "harness real-time e-markets"
    }
} */
///#UserList
class UserList{

  late List<User> userList;

  UserList({required this.userList});

  UserList.fromJson(List json){
    userList = List<User>.from(json.map((map) => User.fromJson(map)));
  }

  Map<String, dynamic> toJson() => {
    "userList" : List<Map<String, dynamic>>.from(userList.map((map) => map.toJson())),
  };

}


///#User
class User {
  late int id;
  late String name;
  late String username;
  late String email;
  late Address address;
  late String phone;
  late String website;
  late Company company;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.address,
      required this.phone,
      required this.website,
      required this.company});

  User.fromJson(Map<String,dynamic>json){
    id = json["id"];
    name = json["name"];
    username = json["username"];
    email = json["email"];
    address = Address.fromJson(json["address"]);
    phone = json["phone"];
    website = json["website"];
    company = Company.fromJson(json["company"]);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "address": address.toJson(),
    "phone": phone,
    "website": website,
    "company": company.toJson(),
  };
}


///#Adress
class Address {
  late String street;
  late String suite;
  late String city;
  late String zipcode;
  late Geo geo;

  Address(
      {required this.city,
      required this.street,
      required this.geo,
      required this.suite,
      required this.zipcode});

  Address.fromJson(Map<String, dynamic> json) {
    street = json["street"];
    suite = json["suite"];
    city = json["city"];
    zipcode = json["zipcode"];
    geo = Geo.fromJson(json["geo"]);
  }

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "suite": suite,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}


///#Geo
class Geo {
  late String lat;
  late String lng;

  Geo({required this.lat, required this.lng});

  Geo.fromJson(Map<String, dynamic> json) {
    lng = json["lng"];
    lat = json["lat"];
  }

  Map<String, dynamic> toJson() => {
        "lng": lng,
        "lat": lat,
      };
}

class Company {
  late String name;
  late String catchPhrase;
  late String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  Company.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    catchPhrase = json["catchPhrase"];
    bs = json["bs"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
