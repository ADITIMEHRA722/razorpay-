

import 'package:flutter/material.dart';
import 'package:razorpay_1/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
