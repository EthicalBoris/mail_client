import 'package:flutter/material.dart';
import 'package:mail_client/MessageList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mailbox',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.blue,
      ),
      home: MessageList(title: 'Bobo Mail Service'),
    );
  }
}

