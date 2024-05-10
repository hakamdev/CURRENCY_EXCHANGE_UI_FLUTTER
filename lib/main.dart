import 'package:currency_converter_demo_app/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: Color(0xFFffffff),
          onBackground: Color(0xFFf1f1f1),
          primary: Color(0xFF3ff199),
          onPrimary: Color(0xFFFFFFFF),
          secondary: Color(0xFF2f5cc0),
          onSecondary: Color(0xFFffffff),
          tertiary: Color(0xFF000000),
          onTertiary: Color(0xFFffffff),
          surface: Color(0xFFffffff),
          onSurface: Color(0xFFFFFFFF),
          error: Color(0xFFA20606),
          onError: Color(0xFFFFFFFF),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
