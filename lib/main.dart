import 'package:batch_16/signup/sign_up_screen_dart.dart';
import 'package:flutter/material.dart';
import 'package:batch_16/signup/sign_up_screen_dart.dart'; // Import file sign_up_screen.dart

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(), // Sử dụng SignUpScreen() làm trang chính của ứng dụng
    );
  }
}
