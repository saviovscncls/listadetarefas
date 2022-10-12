import 'dart:convert';

class Todo{


  Todo({required this.title, required this.dateTime});

  Todo.FromJson(Map<String, dynamic> json)
  : title = json['Title'],
    dateTime = DateTime.parse(json['dateTime']);

  String title;
  DateTime dateTime;

  Map<String, dynamic>toJson(){
    return {
      'Title': title,
      'dateTime': dateTime.toIso8601String()

    };
  }
}