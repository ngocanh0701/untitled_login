import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  String password;
  String user;

  Post({
    required this.password,
    required this.user,
  });
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    user: json["user"],
    password: json["password"]
  );

  Map<String, dynamic> toJson()=> {
    "user": user,
    "password": password,
  };
}
