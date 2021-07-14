import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepository{
  // static String mainUrl = "https://reqres.in";
  // var loginUrl = "$mainUrl/api/login";

  //static String mainUrl = "http://192.168.35.229:18001/api/v1";
  static String mainUrl = "http://183.111.67.189:18001/api/v1";
  var loginUrl = "$mainUrl/users/signIn";
  var signUpUrl = "$mainUrl/users/signUp";

  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();

  Future<bool> hasUser() async{
    var value = await storage.read(key: 'User');
    if(value != null){
      return true;
    }else{
      return false;
    }
  }


  Future<void> persisteUser(String user) async{
    await storage.write(key: 'User', value: user);
  }
  
  Future<void> deleteUser() async {
    storage.delete(key: 'User');
    storage.deleteAll();
  }

  static const Map<String, String> _JSON_HEADERS = {
    "content-type": "application/json"
  };

  Future<String> login(String email, String password)async{
    var data = {
      "email": email,
      "password": password
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(loginUrl, headers: _JSON_HEADERS,
        body: body);
    print(response);
    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      await persisteUser(map["data"]["email"]);

      // String value = await storage.read(key: "User");
      //
      // print(value);
      return map["data"]["email"];
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }

  Future<String> signUp(String email, String password, String phoneNumber, String confirmPassword)async{
    var data = {
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "phone": phoneNumber,
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(signUpUrl, headers: _JSON_HEADERS, body: body);

    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      await persisteUser(map["data"]["email"]);

      return map["data"]["email"];
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }

  Future<String> phoneNumber(String phoneNumber)async{
    Response response = await _dio.post(loginUrl,data: {
      "phoneNumber": phoneNumber,
    });
    return response.data["user"];
  }
}