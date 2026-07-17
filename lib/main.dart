import 'package:flutter/material.dart';
import 'pages/startup_home_page.dart';

void main() {
  runApp(const StartupApp());
}

class StartupApp extends StatelessWidget {
  const StartupApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,

        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Color(0xff0D1B2A),
          foregroundColor: Colors.white,
        ),

      bottomAppBarTheme: const BottomAppBarThemeData(
        color: Colors.white,
        elevation: 8,
      ),
      ),

      home: const StartupHomePage(),
    );
  }
}