import 'package:flutter/material.dart';
import 'package:responsive_pro_example/brain/constants.dart';
import 'package:responsive_pro_example/ui/introduction_screen.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: bgColor,
        useMaterial3: true,
      ),
      home: IntroductionScreen(),
    );
  }
}
