import 'dart:convert';
import 'package:http/http.dart';

import '../models/user_model.dart';

class HttpService {
  // Base url
  static String BASE_URL = "jsonplaceholder.typicode.com";

  // Header
  static Map<String, String> headers =  {
    'Content-type': 'application/json; charset=UTF-8',
  };

  // Apis
  static String API_TODO_LIST = "/users";
  static String API_TODO_ONE = "/users/1"; // {ID}
  static String API_CREATE_TODO = "/users";
  static String API_UPDATE_TODO = "/users/1"; //  {ID}
  static String API_EDIT_TODO = "/users/1"; //  {ID}
  static String API_DELETE_TODO = "/users/"; //  {ID}

  // Methods
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await get(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PATCH(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api);
    Response response = await patch(uri, headers: headers, body: jsonEncode(params));
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE_URL, api, params);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // Params
  static Map<String, String> paramEmpty() {
    Map<String, String> map = {};
    return map;
  }
  //
  static Map<String, String> paramsCreate(User user) {
    Map<String, String> map = {
      "id": user.id.toString(),
      "name": user.name,
      "username": user.username,
      "address": user.address.toJson().toString(),
      "phone": user.phone,
      "website": user.website,
      "company": user.company.toJson().toString(),
    };
    return map;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> map = {
      "id": user.id.toString(),
      "name": user.name,
      "username": user.username,
      "address": user.address.toJson().toString(),
      "phone": user.phone,
      "website": user.website,
      "company": user.company.toJson().toString(),
    };
    return map;
  }

  static Map<String, String> paramsEdit(User user) {
    Map<String, String> map = {
      "id": user.id.toString(),
      "name": user.name,
      "username": user.username,
      "address": user.address.toJson().toString(),
      "phone": user.phone,
      "website": user.website,
      "company": user.company.toJson().toString(),
    };
    return map;
  }


  /* HTTP Parsing*/

static User parseUser(String response){
  dynamic json = jsonDecode(response);
  var data = User.fromJson(json);
  return data;
}

static UserList parseUserList(String response){
  var json = jsonDecode(response);
  UserList data = UserList.fromJson(json);
  return data;
}

  static List<String> storeListNote(List<User> items){
    List<String> stringNote = items.map((e) => jsonEncode(e.toJson())).toList();
    return stringNote;
  }
}
