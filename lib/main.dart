import 'package:chat/pages/auth_or_app_page.dart';
import 'package:chat/pages/auth_page.dart';
import 'package:flutter/material.dart'; // Add this line to import DefaultFirebaseOptions



void main() async{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(
          secondary: Colors.grey,
        ),

        useMaterial3: true,
      ),
      home: AuthOrAppPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
