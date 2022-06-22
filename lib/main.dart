import 'package:flutter/material.dart';
import 'package:flutter_mini_project/route_generator_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGeneratorSettings().onGenerateRoute,
    );
  }
}
