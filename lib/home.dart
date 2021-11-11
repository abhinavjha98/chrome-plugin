import 'package:flutter/material.dart';
import 'package:smsapp/components/NavigationDrawer.dart';
import 'package:smsapp/dashboard.dart';
import 'package:smsapp/inbox.dart';
import 'package:smsapp/location.dart';

class Home extends StatefulWidget {
  @override
  State createState() {
    return HomeState();
  }
}

class HomeState extends State {
  int currentIndex = 0;
  final screens = [
    Dashboard(),
    MyInbox(),
  ];
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("SMS Inbox"),
            GestureDetector(
              child: Icon(Icons.location_on),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (__) => new Location(),
                  ),
                );
              },
            ),
          ],
        ),
        centerTitle: true,
        // leading: GestureDetector(
        //   child: Icon(Icons.location_on),
        //   onTap: () {
        //     Navigator.push(
        //       context,
        //       new MaterialPageRoute(
        //         builder: (__) => new Location(),
        //       ),
        //     );
        //   },
        // ),
        // backgroundColor: Colors.blue,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedFontSize: 16,
        showUnselectedLabels: false,
        unselectedFontSize: 12,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          )
        ],
      ),
    );
  }
}
