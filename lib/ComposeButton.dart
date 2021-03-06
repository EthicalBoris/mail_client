import 'package:flutter/material.dart';

import 'MessageCompose.dart';
import 'Message.dart';

class ComposeButton extends StatelessWidget {
  List<Message> messages;

  ComposeButton(List<Message> messages) {
    this.messages = messages;
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        Message message = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => MessageCompose(),
          ),
        );

        if (message == null) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your message has not been sent: ERROR"),
              backgroundColor: Colors.red,
              duration: new Duration(seconds: 2),
            ),
          );
        } else if (message != null) {
          messages.add(message);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your message has been sent"),
              backgroundColor: Colors.green,
              duration: new Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}
