import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.createUser(Map<String, dynamic> jsonObject) {
    return User(
      id: jsonObject["id"].toString(),
      email: jsonObject["email"],
      firstName: jsonObject["first_name"],
      lastName: jsonObject["last_name"],
      avatar: jsonObject["avatar"],
    );
  }

  static Future<User> connectToApi(String id) async {
    String apiUrl = "https://reqres.in/api/users/$id";

    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);
    var userData = (jsonObject as Map<String, dynamic>)["data"];
    return User.createUser(userData);
  }

  static Future<List<User>> getUsers(String page) async {
    String apiUrl = "https://reqres.in/api/users?page=$page";
    var apiResult = await http.get(Uri.parse(apiUrl));
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)["data"];
    List<User> users = [];
    for (var i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }

    return users;
  }
}
