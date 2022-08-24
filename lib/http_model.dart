import 'dart:convert';

import 'package:http/http.dart' as http;

// reference link: https://reqres.in/
class HttpModel {
  String id;
  String name;
  String job;
  String createdAt;

  HttpModel({
    required this.id,
    required this.name,
    required this.job,
    required this.createdAt,
  });

  //untuk factory new instance dari HTTPModel
  factory HttpModel.createPostResult(Map<String, dynamic> jsonObject) {
    return HttpModel(
      id: jsonObject["id"],
      name: jsonObject["name"],
      job: jsonObject["job"],
      createdAt: jsonObject["createdAt"],
    );
  }

  static Future<HttpModel> connectToApi(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";

    var apiResult = await http.post(Uri.parse(apiUrl), body: {
      "name": name,
      "job": job,
    });

    var jsonObject = json.decode(apiResult.body);
    return HttpModel.createPostResult(jsonObject);
  }
}
