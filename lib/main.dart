import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/form_provider.dart';
import 'screens/form_screen.dart';
import 'screens/cts_score_grid_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Score Card',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FormScreen(),
    );
  }
}