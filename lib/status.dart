import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:smsapp/messageDisplay.dart';
import 'package:smsapp/utils/http-client.dart';

class UrlStatus extends StatefulWidget {
  final SmsMessage messages;
  const UrlStatus({Key key, this.messages}) : super(key: key);
  @override
  _UrlStatusState createState() => _UrlStatusState();
}

class _UrlStatusState extends State<UrlStatus> {
  bool _urlStatus = false;
  @override
  void initState() {
    // TODO: implement initState

    statusUrl(widget.messages.body.toString());
    super.initState();
  }

  void phishingUrl(text) async {
    var data = await HttpClients().setData(text);

    if (data == "Bad Url") {
      // setState(() {
      //   _urlStatus = false;
      // });
    } else {
      setState(() {
        _urlStatus = true;
      });
    }
  }

  bool statusUrl(text) {
    print(text.runtimeType);
    phishingUrl(text);

    return _urlStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(
          Icons.markunread,
          color: Colors.blue,
        ),
        title: Text(widget.messages.address),
        trailing: _urlStatus
            ? Icon(
                Icons.flag,
                color: Colors.green,
                size: 40.0,
              )
            : Icon(
                Icons.flag,
                color: Colors.red,
                size: 40.0,
              ),
        subtitle: Text(
          widget.messages.body,
          maxLines: 5,
          style: TextStyle(),
        ),
        onTap: () {
          // setState(() {
          //   phishingUrl(widget.messages.body.toString());
          // });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MessageDisplay(
                message: widget.messages.body,
                contact: widget.messages.address,
                status: _urlStatus,
              ),
            ),
          );
        },
      ),
    );
  }
}
