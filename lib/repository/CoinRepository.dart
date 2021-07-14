import 'dart:collection';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CoinRepository{

  //static String mainUrl = "http://192.168.35.229:18001/api/v1";
  static String mainUrl = "http://183.111.67.189:18001/api/v1";
  var createWalletUrl = "$mainUrl/tron/createWallet";
  var getBalanceUrl = "$mainUrl/tron/getBalance";
  var sendTokenUrl = "$mainUrl/tron/sendToken";
  var sendTransactionUrl = "$mainUrl/tron/sendTransaction";

  final Dio _dio = Dio();

  static const Map<String, String> _JSON_HEADERS = {
    "content-type": "application/json"
  };

  Future<Map> getBalance(String email)async{
    var data = {
      "email": email
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(getBalanceUrl, headers: _JSON_HEADERS,
        body: body);
    print(response);
    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      String tronBalance = map["data"]["tronBalance"];
      String gmcBalance = map["data"]["gmcBalance"];
      Map<String, String> resultMap = {"tronBalance" : tronBalance, "gmcBalance" : gmcBalance};
      return resultMap;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }

  Future<Map> getWallet(String email)async{
    var data = {
      "email": email
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(createWalletUrl, headers: _JSON_HEADERS,
        body: body);
    print(response);
    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      String address = map["data"]["address"];
      Map<String, String> resultMap = {"address" : address};
      return resultMap;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }

  Future<bool> sendToken(String email, String toAddress, double amount)async{
    var data = {
      "email": email, "toAddress" : toAddress, "amount": amount
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(sendTokenUrl, headers: _JSON_HEADERS,
        body: body);
    print(response);
    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      bool isSend = map["data"]["send"];
      return isSend;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }

  Future<bool> sendTransaction(String email, String toAddress, double amount)async{
    var data = {
      "email": email, "toAddress" : toAddress, "amount": amount
    };
    var body = json.encode(data);
    http.Response response = await http.Client().post(sendTransactionUrl, headers: _JSON_HEADERS,
        body: body);
    print(response);
    try {

      //List data = jsonDecode(response.body);
      Map<String, dynamic> map = json.decode(response.body);
      bool isSend = map["data"]["send"];
      return isSend;
    } catch (exception) {
      print(response.body);
      throw ('An error occurred');
    }
    //return response.data["user"];
  }


}