import 'package:flutter/material.dart';
import 'package:untitled_login/page/load_page.dart';
import 'package:untitled_login/page/register_page.dart';
import 'page/login_page.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadPage(),
    );
  }
}
// //
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Đăng Ký Tài Khoản')),
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: RegistrationForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RegistrationForm extends StatefulWidget {
//   @override
//   _RegistrationFormState createState() => _RegistrationFormState();
// }
//
// class _RegistrationFormState extends State<RegistrationForm> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController = TextEditingController();
//   String _passwordMismatchError = '';
//
//   void _validatePasswords() {
//     setState(() {
//       if (_passwordController.text != _confirmPasswordController.text) {
//         _passwordMismatchError = 'Mật khẩu không khớp';
//       } else {
//         _passwordMismatchError = '';
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextField(
//           controller: _passwordController,
//           obscureText: true,
//           decoration: InputDecoration(
//             hintText: 'Mật khẩu',
//           ),
//         ),
//         TextField(
//           controller: _confirmPasswordController,
//           obscureText: true,
//           decoration: InputDecoration(
//             hintText: 'Xác nhận mật khẩu',
//             errorText: _passwordMismatchError.isEmpty ? null : _passwordMismatchError,
//           ),
//           onChanged: (text) => _validatePasswords(),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             _validatePasswords();
//             if (_passwordMismatchError.isEmpty) {
//               // Gửi dữ liệu đến server
//             }
//           },
//           child: Text('Đăng Ký'),
//         ),
//       ],
//     );
//   }
// }
