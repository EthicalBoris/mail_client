//import 'dart:html';
import 'package:email_validator/email_validator.dart';

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

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Compose New Message"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (EmailValidator.validate(value)) {
                      return null;
                    } else {
                      return "Not a valid email";
                    }
                  },
                  onSaved: (value) => to = value,
                  decoration: InputDecoration(
                    labelText: "To",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value.length == 0) {
                      return "Must supply a subject";
                    }
                    return null;
                  },
                  onSaved: (value) => subject = value,
                  decoration: InputDecoration(
                    labelText: "Subject",
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: TextFormField(
                  validator: (value) {
                    if (value.length == 0) {
                      return "Must supply a message body";
                    }
                    return null;
                  },
                  onSaved: (value) => body = value,
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
                    if (this.key.currentState.validate()) {
                      this.key.currentState.save();

                      Message message = Message(subject, body);
                      Navigator.pop(context, message);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
