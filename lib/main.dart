import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EmotionalAssistantApp());
}

class EmotionalAssistantApp extends StatelessWidget {
  const EmotionalAssistantApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emotional Voice Assistant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
