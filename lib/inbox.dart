import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:smsapp/status.dart';

class MyInbox extends StatefulWidget {
  const MyInbox({Key key}) : super(key: key);

  @override
  _MyInboxState createState() => _MyInboxState();
}

class _MyInboxState extends State<MyInbox> {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> messages = new List<SmsMessage>();
  bool urlStatus = true;
  fetchSMS() async {
    messages = await query.getAllSms;
    print(messages);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchSMS(),
      builder: (context, AsyncSnapshot snapshot) {
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return UrlStatus(messages: messages[index]);
              //   Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ListTile(
              //     leading: Icon(
              //       Icons.markunread,
              //       color: Colors.blue,
              //     ),
              //     title: Text(messages[index].address),
              //     trailing: urlStatus
              //         ? VerticalDivider(
              //             color: Colors.green,
              //             thickness: 10.0,
              //           )
              //         : VerticalDivider(
              //             color: Colors.red,
              //             thickness: 10.0,
              //           ),
              //     subtitle: Text(
              //       messages[index].body,
              //       maxLines: 4,
              //       style: TextStyle(),
              //     ),
              //     onTap: () {
              //       setState(() {
              //         phishingUrl(messages[index].body.toString());
              //       });
              //     },
              //   ),
              // );
            });
      },
    );
  }
}
