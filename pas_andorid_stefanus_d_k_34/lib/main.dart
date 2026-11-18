import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kuliner & Liga Inggris',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFEE4D2D)),
        useMaterial3: true,
      ),
      initialRoute: Routers.login,
      getPages: Routers.pages,
    );
  }
}
