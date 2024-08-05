import 'package:flutter/material.dart';
import 'package:untitled_login/page/login_page.dart';

import '../components/my_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void comebackHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: Column(
          children: [
            const SizedBox(height: 25),
            MyButton(
              onTap: comebackHome,
              text: 'Back Home',
            ),
            const SizedBox(height: 25),
          ],
        ))));
  }
}
