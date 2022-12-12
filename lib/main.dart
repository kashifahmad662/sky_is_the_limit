import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skyisthelimit/web-app/features/HomePage/view/home-page.dart';
import 'package:skyisthelimit/web-app/features/main-web.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
