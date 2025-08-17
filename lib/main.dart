import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const ZytronicApp());
}

class ZytronicApp extends StatelessWidget {
  const ZytronicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zytronic WhatsApp',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
