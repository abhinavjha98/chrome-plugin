import 'package:flutter/material.dart';

class MessageDisplay extends StatefulWidget {
  final String message;
  final String contact;
  final bool status;

  const MessageDisplay({Key key, this.message, this.contact, this.status})
      : super(key: key);
  @override
  _MessageDisplayState createState() => _MessageDisplayState();
}

class _MessageDisplayState extends State<MessageDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact),
        backgroundColor: widget.status ? Colors.green : Colors.red,
        centerTitle: true,
        // backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Text(widget.message,style: TextStyle(fontSize: 20.0),)),
      ),

    );
  }
}
