import 'package:flutter/material.dart';

class MyPasswordLogin extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const MyPasswordLogin({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  _MyPasswordLoginState createState() => _MyPasswordLoginState();
}

class _MyPasswordLoginState extends State<MyPasswordLogin> {
  bool _obscureText = true;
  String _passwordStrength = '';

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
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
            controller: widget.controller,
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
        ],
      ),
    );
  }


//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 25.0),
//     child: TextField(
//       controller: widget.controller,
//       obscureText: _obscureText,
//       decoration: InputDecoration(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.white),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black),
//         ),
//         fillColor: Colors.grey,
//         filled: true,
//         hintText: widget.hintText,
//         hintStyle: TextStyle(color: Colors.black),
//         suffixIcon: IconButton(
//           icon: Icon(
//             _obscureText ? Icons.visibility : Icons.visibility_off,
//             color: Colors.black,
//           ),
//           onPressed: _toggleVisibility,
//         ),
//       ),
//     ),
//   );
// }
}
