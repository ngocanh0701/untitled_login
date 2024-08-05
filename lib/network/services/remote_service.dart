import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled_login/network/post.dart';

class RemoteService{
  Future<List<Post>?> getPosts() async{
    var client = http.Client();
    
    var url = Uri.parse('http://10.0.2.2:5000/api/data');
    var response = await client.get(url);
    if(response.statusCode == 200){
      var json = response.body;
      return postFromJson(json);
    } else {
      print('fAILED TO LOAD');
      return null;
    }
  }


  Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data['access_token'];
    } else {
      // Xử lý lỗi, có thể ném ngoại lệ hoặc trả về thông báo lỗi
      return null;
    }
  }

  Future<Map<String, dynamic>?> register(String username, String password, String name, String phone) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:5000/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name':name,
        'phone':phone,
        'username': username,
        'password': password,
      }),
    );
    final Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      //final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else if(response.statusCode == 401){
      return data;
    }
  }
}