import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test/web-app/features/HomePage/view/home-page.dart';
import 'package:test/web-app/features/main-web.dart';

void main() async {
  // //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDe0m56rzDzzPgOEvd0HwqTc1dEzZAGHbI",
      appId: "1:195233003771:web:16b4255abb20820cf2185e",
      messagingSenderId: "195233003771",
      projectId: "sky-is-the-limit-7208a",
    ),
  );
  runApp(const WebApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sky is The Limit',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}
