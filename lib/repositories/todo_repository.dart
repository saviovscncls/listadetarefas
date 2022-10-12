import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/todo.dart';

const todoListKey = 'todo_list';
class TodoRepository {
  late SharedPreferences sharedPreferences;

  Future<List<Todo>> getTodoList () async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(todoListKey) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;
    return jsonDecoded.map((e) => Todo.FromJson(e)).toList();
}
  void saveListTodo(List<Todo> todos) {
    final jsonString = json.encode(todos);
    sharedPreferences.setString(todoListKey, jsonString);
  }
}
