import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:mail_client/ComposeButton.dart';

import 'package:mail_client/Message.dart';
import 'package:mail_client/MessageCompose.dart';

import 'MessageDetail.dart';

class MessageList extends StatefulWidget {
  final String title;

  MessageList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  Future<List<Message>> messages;

  initState() {
    super.initState();
    messages = Message.browse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                messages = Message.browse();
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: messages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:

            case ConnectionState.waiting:

            case ConnectionState.active:
              return Center(
                child: CircularProgressIndicator(),
              );

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text('There was an Error: ${snapshot.error}');
              } else {
                var messages = snapshot.data;
                return ListView.separated(
                  itemCount: messages.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (BuildContext context, int index) {
                    Message message = messages[index];

                    return ListTile(
                      title: Text(message.subject),
                      isThreeLine: true,
                      leading: CircleAvatar(
                        child: Text('BD'),
                      ),
                      subtitle: Text(
                        message.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MessageDetail(message.subject, message.body),
                          ),
                        );
                      },
                    );
                  },
                );
              }
          }
        },
      ),
      floatingActionButton: ComposeButton(),
    );
  }
}
