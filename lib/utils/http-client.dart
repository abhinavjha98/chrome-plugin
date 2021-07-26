import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpClients {
  Future<void> getData() async {
    var res = await http.get('');
    print(res.body);
  }

  Future<String> setData(url) async {
    var headers = {
      'Content-type': 'application/json',
    };
    var data = {"message": url};
    var res = await http.post("http://20.98.205.93:8000/api/m/smsurls/",
        body: json.encode(data), headers: headers);

    print(res.body);
    var respData = json.decode(utf8.decode(res.bodyBytes));
    return respData['status'];
  }

  Future<String> register(String email, String username, String name,
      String password, String mobile) async {
    var headers = {
      'Content-type': 'application/json',
    };
    var data = {
      "email": email,
      "name": name,
      "username": username,
      "password": password,
      "mobile": mobile,
    };
    var res = await http.post("http://20.98.205.93:8000/api/m/signup/",
        body: json.encode(data), headers: headers);

    print(res.body);
    var respData = json.decode(utf8.decode(res.bodyBytes));
    return respData['status'];
  }
}
