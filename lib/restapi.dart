import 'dart:convert';

import 'package:http/http.dart' as http;
// import 'package:simple/model/get.dart';

class Restapi {
  String baseUrl = 'http://localhost:8080/';
  Future<List> getdata() async {
 
    try {
      var response = await http.get(Uri.parse(baseUrl));
   
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
