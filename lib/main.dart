import 'dart:io';
import 'package:flutter/material.dart';
import 'package:news/screens/home/home.dart';
import 'package:news/utils/http_override_request.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routeName: (_) => Home(),
      },
      initialRoute: Home.routeName,
    );
  }
}
