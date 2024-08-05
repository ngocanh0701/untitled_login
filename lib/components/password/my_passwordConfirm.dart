import 'package:flutter/material.dart';
class MyPasswordconfirm extends StatefulWidget {
  final TextEditingController confirmcontroller;
  final TextEditingController passcontroller;
  final String hintText;

  const MyPasswordconfirm({
    super.key,
    required this.passcontroller,
    required this.hintText,
    required this.confirmcontroller
  });

  @override
  State<MyPasswordconfirm> createState() => _MyPasswordconfirmState();
}

class _MyPasswordconfirmState extends State<MyPasswordconfirm> {
  bool _obscureText = true;
  String _passwordStrength = '';
  String _passwordMismatchError = '';

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validatePasswords() {
    setState(() {
      if (widget.passcontroller.text != widget.confirmcontroller.text) {
        _passwordMismatchError = 'Mật khẩu không khớp';
      } else {
        _passwordMismatchError = '';
      }
    });
  }
  void _checkPasswordStrength(String password) {
    String strength = '';
    if (password.isEmpty) {
      strength = 'Empty';
    } else if (password.length < 6) {
      strength = 'weak';
    } else if (password.length < 10) {
      strength = 'Average';
    } else if (password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      strength = 'Strong';
    } else {
      strength = 'Decent';
    }

    setState(() {
      _passwordStrength = strength;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          TextField(
            controller: widget.passcontroller,
            obscureText: _obscureText,
            onChanged: _checkPasswordStrength,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              fillColor: Colors.grey,
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: _toggleVisibility,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('Độ mạnh của mật khẩu=: $_passwordStrength'),

          TextField(
            controller: widget.confirmcontroller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              fillColor: Colors.grey,
              filled: true,
              hintText: 'Confirm Password',
              hintStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: _toggleVisibility,
              ),
              errorText: _passwordMismatchError.isEmpty ? null : _passwordMismatchError,
            ),
            onChanged: (text) => _validatePasswords(),
          ),
          // SizedBox(height: 10),
          // Text('Password Strength: $_passwordStrength'),
        ],
      ),
    );
  }
}
