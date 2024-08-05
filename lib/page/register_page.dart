import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled_login/components/my_button.dart';
import 'package:untitled_login/components/password/my_passwordConfirm.dart';
import 'package:untitled_login/components/my_text.dart';
import 'package:untitled_login/components/my_textfield.dart';
import 'package:untitled_login/components/square_tile.dart';
import 'package:untitled_login/page/home_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:untitled_login/page/login_page.dart';
import '../network/services/remote_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<Map<String, dynamic>>? apiData;
  late RemoteService _remoteService = RemoteService();

  //LoginPage({required this.appData});
// text editing controlers
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _passwordMismatchError = '';
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _register();
  }

  Future<void> _register() async {
    if (_usernameController.text != '' && _passwordController.text != '') {
      if (_confirmpasswordController.text == _passwordController.text) {
        final Map<String, dynamic>? data = await _remoteService.register(
            _usernameController.text,
            _passwordController.text,
            _nameController.text,
            _phoneController.text);

        if (data?['status'] == 'success') {
          // Xử lý token (lưu trữ, sử dụng, v.v.)
          _showDialog(data?['msg']);
        } else if (data?['status'] == 'failure') {
          _showDialog(data?['msg']);
        } else {
          // Xử lý lỗi đăng nhập
          print('Login failed');
          // _showErrorDialog();
        }
      } else {
        print('mat khau khong trung nhau');
      }
    }
  }

  void _naviga() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  void _showDialog(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(""),
          content: Text('$msg'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => LoginPage(),
                //   ),
                // );
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
                  const SizedBox(height: 30),
                  // logo
                  const Icon(
                    Icons.sign_language_rounded,
                    size: 50,
                  ),

                  const SizedBox(height: 25),

                  // welcomne back, you've been missed
                  const Text(
                    'Sign up with us',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),

                  const SizedBox(height: 25),

                  //username textfiedld
                  MyTextfield(
                    controller: _nameController,
                    hintText: 'Name',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  //password textfield
                  MyTextfield(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  MyTextfield(
                    controller: _usernameController,
                    hintText: 'Username',
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),

                  MyPasswordconfirm(
                      passcontroller: _passwordController,
                      hintText: 'password',
                      confirmcontroller: _confirmpasswordController),

                  const SizedBox(height: 25),

                  //forgot password?
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       Text(
                  //         'Forgot Password?',
                  //         style: TextStyle(color: Colors.grey),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 25),

                  //sign in button
                  MyButton(
                    onTap: _register,
                    text: 'Sign up',
                  ),
                  const SizedBox(height: 5),

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

                  const SizedBox(height: 5),

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
                  const SizedBox(height: 5),

                  // no t a mem ber? register now
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a User?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 4),
                      MyText(onTap: _naviga, text: 'Login now')
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
