import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/viewmodels/character_view_model.dart';
import 'package:rickandmorty/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (BuildContext context) => CharacterViewModel(),
        child: const PageMain(),
      ),
    );
  }
}
