import 'package:expense_wise/loginpage.dart';
import 'package:expense_wise/page2.dart';
import 'package:expense_wise/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: registerpage(),
    );
  }
}
