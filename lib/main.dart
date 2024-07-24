// lib/main.dart
import 'package:bloc_clean/src/features/user/presentation/pages/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'injectable_config.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserProfileScreen(),
    );
  }
}
