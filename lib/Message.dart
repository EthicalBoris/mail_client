import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part 'Message.g.dart';

@JsonSerializable()
class Message {
  final String subject;
  final String body;

  Message(this.subject, this.body);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  static Future brose() async{
     http.Response response = await http.get(
        'http://www.mocky.io/v2/5e4c7b5b310000e2cad8bfb1'); // Remember to generate mocky from message.json

    await Future.delayed(Duration(seconds: 3));    

    String content = response.body;
    List collection = json.decode(content);
    List<Message> _messages =
        collection.map((json) => Message.fromJson(json)).toList();

    return _messages;    
  }
}
