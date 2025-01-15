import 'package:flutter/material.dart';
import 'package:nevigationswitch/inputScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:"Nevigation and Routing",
      initialRoute:'/',
      routes:<String,Widget Function(BuildContext)>{
        '/':(BuildContext context)=>InputScreen(),
      }
    );
  }
}