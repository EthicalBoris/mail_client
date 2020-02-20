import 'package:flutter/material.dart';

import 'Message.dart';

class MessageDetail extends StatelessWidget {
  final String subject;
  final String message;

  MessageDetail(this.subject, this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.subject),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Text(this.message),
      ),
    );
  }
}
