import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yummy_meals/screens/tabs.dart';

final textTheme = GoogleFonts.latoTextTheme();
const seedColor = Color.fromARGB(255, 131, 57, 0);
final themeData = ThemeData(
  useMaterial3: true,
  textTheme: textTheme,
  colorScheme: ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: Brightness.dark,
  ),
);

void main() {
  runApp(
    const ProviderScope(
      child: YummyMealsApp(),
    ),
  );
}

class YummyMealsApp extends StatelessWidget {
  const YummyMealsApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      theme: themeData,
      home: const TabsScreen(),
    );
  }
}
