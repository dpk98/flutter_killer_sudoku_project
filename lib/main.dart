import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/Game_Play/sudoku_Widget.dart';
import 'package:flutter_killer_sudoku/home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SudokuWidget()//MyHomePage(title: "Killer Sudoku"),
    );
  }
}

