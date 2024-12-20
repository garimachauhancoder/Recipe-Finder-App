import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe/HomeScreen.dart';
import 'package:recipe/constant.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: "Hellix"),
      home: HomeScreen(),
    );
  }
}


