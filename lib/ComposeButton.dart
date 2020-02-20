import 'package:flutter/material.dart';

import 'MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
        String intention = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => MessageCompose()));

        if (intention == null) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Your message has not been sent: $intention"),
              backgroundColor: Colors.red,
              duration: new Duration(seconds: 2),
            ),
          );
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Youw message has been sent with $intention"),
              backgroundColor: Colors.green,
              duration: new Duration(seconds: 2),
            ),
          );
        }
      },
    );
  }
}
