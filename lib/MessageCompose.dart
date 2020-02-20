//import 'dart:html';

import 'package:flutter/material.dart';

import 'Message.dart';

class MessageCompose extends StatefulWidget {
  @override
  _MessageComposeState createState() => _MessageComposeState();
}

class _MessageComposeState extends State<MessageCompose> {
  String to = "";
  String subject = "";
  String body = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: TextField(
                onChanged: (value) {
                  to = value;
                },
                decoration: InputDecoration(
                  labelText: "To",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  subject = value;
                },
                decoration: InputDecoration(
                  labelText: "Subject",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: TextField(
                onChanged: (value) {
                  body = value;
                },
                decoration: InputDecoration(
                  labelText: "Message",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                maxLines: 8,
              ),
            ),
            ListTile(
              title: RaisedButton(
                child: Text("Send"),
                onPressed: () {
                  Message message = Message(subject, body);

                  Navigator.pop(context, message);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
