import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoModel {
  String title;
  String detail;
  bool isDone;
  // int id;

  TodoModel({
    required this.title,
    required this.detail,
    required this.isDone,
    // required this.id,
  });

  factory TodoModel.createTodoModel(Map<String, dynamic> jsonObject) {
    return TodoModel(
      title: jsonObject["title"],
      detail: jsonObject["detail"],
      isDone: jsonObject["done"],
      // id: jsonObject["id"],
    );
  }

  // static Future<TodoModel> connectToApi() async {
  //   String apiUrl = "https://workshop-b201-todo.herokuapp.com/tasks";
  //   var apiResult = await http.get(Uri.parse(apiUrl));
  //   var jsonObject = json.decode(apiResult.body);
  //   var todo = jsonObject as Map<String, dynamic>;
  //   return TodoModel.createTodoModel(todo);
  // }

  static Future<List<TodoModel>> getTodos() async {
    String apiUrl = "https://workshop-b201-todo.herokuapp.com/tasks";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    // print("ini json object");
    // print(jsonObject);
    // List<dynamic> listTodo = (jsonObject as Map<String, dynamic>)[''];
    List<TodoModel> todos = [];
    for (var i = 0; i < jsonObject.length; i++) {
      todos.add(TodoModel.createTodoModel(jsonObject[i]));
    }

    // print("=");
    // print("ini todo");
    print(todos);
    return todos;
  }

  static Future<TodoModel?> postTodos(
    String title,
    String detail,
    bool isDone,
  ) async {
    String apiUrl = "https://workshop-b201-todo.herokuapp.com/tasks";

    var apiResult = await http.post(
      Uri.parse(apiUrl),
      body: {
        'title': title,
        'detail': detail,
        'done': isDone.toString(),
      },
    );

    Map<String, dynamic> jsonObject = json.decode(apiResult.body);

    print('Ini apiResult:\n');
    print(apiResult.body);

    print("Ini jsonObject:\n");
    print(jsonObject);

    return TodoModel.createTodoModel(jsonObject);
  }

  static Future<http.Response> delete(String id) async {
    String apiUrl = "https://workshop-b201-todo.herokuapp.com/tasks/$id";

    final http.Response response = await http.delete(Uri.parse(apiUrl));

    return response;
  }
}
