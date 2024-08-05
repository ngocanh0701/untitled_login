import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled_login/components/my_button.dart';
import 'package:untitled_login/components/my_textfield.dart';
import 'package:untitled_login/components/password/my_passwordLogin.dart';
import 'package:untitled_login/components/square_tile.dart';
import 'package:untitled_login/page/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled_login/page/register_page.dart';

import '../components/my_text.dart';
import '../network/services/remote_service.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Map<String, dynamic>>? apiData;
  late RemoteService _remoteService = RemoteService();

  //LoginPage({required this.appData});
// text editing controlers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _login();
  }

  Future<void> _login() async {
    if (_usernameController.text != '' && _passwordController.text != '') {
      final String? token = await _remoteService.login(
        _usernameController.text,
        _passwordController.text,
      );

      if (token != null) {
        // Xử lý token (lưu trữ, sử dụng, v.v.)
        print('Token: $token');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        // Xử lý lỗi đăng nhập
        print('Login failed');
        _showErrorDialog();
      }
    }
  }

  void _naviga() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterPage(),
      ),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Username or Password is wrong.Please sign in again"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

// sign user in method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  // logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),

                  const SizedBox(height: 50),

                  // welcomne back, you've been missed
                  const Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),

                  const SizedBox(height: 25),

                  //username textfiedld
                  MyTextfield(
                    controller: _usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  MyPasswordLogin(
                    controller: _passwordController,
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 10),

                  //forgot password?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  //sign in button
                  MyButton(
                    onTap: _login,
                    text: 'Sign in',
                  ),
                  const SizedBox(height: 25),

                  //or continue with
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Text(
                            'Or continbue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // goog;pe + apple sign in button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      //google
                      SquareTile(imagePath: 'lib/images/google.png'),

                      const SizedBox(width: 15),

                      // apple
                      SquareTile(imagePath: 'lib/images/apple.png')
                    ],
                  ),
                  const SizedBox(height: 20),

                  // no t a mem ber? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      MyText(onTap: _naviga, text: 'Register now'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
