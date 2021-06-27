import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import 'package:smsapp/status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: MyInbox(),
    );
  }
}

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> messages = new List<SmsMessage>();
  bool urlStatus = true;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Inbox"),
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
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
      ),
    );
  }

  fetchSMS() async {
    messages = await query.getAllSms;
    print(messages);
  }
}
