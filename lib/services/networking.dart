import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetWorkHelper {
  //url string
  final String url;

  NetWorkHelper({@required this.url});

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      //TODO : remember to add a popup here
      print("There was an error");
    }
  }
}
