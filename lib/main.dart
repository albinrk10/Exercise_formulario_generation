import 'package:exercise_1/src/di/di_service.dart';
import 'package:flutter/material.dart';
import 'src/config/config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  configureDependencies();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 2).theme(),
      title: 'Material App',
      routerConfig: appRouter,
    );
  }
}
