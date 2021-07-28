import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:smsapp/models/smsModel.dart';

class HttpClients {
  Future<void> getData() async {
    var res = await http.get('');
    print(res.body);
  }

  Future<List<SmsModel>> setData(url) async {
    var headers = {
      'Content-type': 'application/json',
    };
    var data = {"message": url};
    var res = await http.post("http://13.68.27.117:8000/api/m/smsurls/",
        body: json.encode(data), headers: headers);

    print(res.body);
    var respData = json.decode(utf8.decode(res.bodyBytes));
    List<dynamic> datas = respData;
    List<SmsModel> tags = datas
        .map((e) => SmsModel.fromMap(e))
        .where((element) => element != null)
        .toList();
    return Future.value(tags);
  }
}
