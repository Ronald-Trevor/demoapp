import 'package:demo_app/application_bloc.dart';
import 'package:demo_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:((context) => ApplicationBloc()),
      child : const MaterialApp(
      home: HomeScreen(),
    )
    );
  }
}
