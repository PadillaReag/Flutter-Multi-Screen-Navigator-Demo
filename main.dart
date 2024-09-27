import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi-Screen Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 5, 2, 223)),
        useMaterial3: true,
      ),
      // Define the initial route
      initialRoute: '/',
      // Define named routes
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Multi-Screen Navigator Demo'),
        '/screen1': (context) => const Screen1(),
        '/screen2': (context) => const Screen2(),
        '/screen3': (context) => const Screen3(),
        '/screen4': (context) => const Screen4(),
      },
    );
  }
}

