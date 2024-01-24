import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/Game_Play/sudoku_Widget.dart';
import 'package:flutter_killer_sudoku/setting_Screen.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {

  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.reset();
    }
    else {
      stopwatch.start();
    }
  }

  String returnFormattedText() {
    var milli = stopwatch.elapsed.inSeconds;

    String seconds = (milli  % 60).toString().padLeft(2, "0"); // this is for the second
    String minutes = (milli  ~/ 60).toString().padLeft(2, "0"); // this is for the minute

    return "$minutes:$seconds"; //:$milliseconds";
  }

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    t = Timer.periodic(
        const Duration(milliseconds: 30), (timer) {
      setState(() {
      });
    });
  }

  /*void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Alert!!"),
          content: Text("You are awesome!"),
          actions: [
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/



  @override
  Widget build(BuildContext context) {


      //stopwatch.start();
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.red,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text(returnFormattedText(), style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
                          ),
            const SizedBox(width: 80,),
            const Icon(Icons.help),
          ],
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                    child: SizedBox(
                      width:100,
                        child: Text("Setting")
                    ),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: SizedBox(
                      width:100,
                      child: Text("Reset Puzzle")
                  ),
                ),
              ],
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const SettingPage(),
                    ),
                );

                // if value 2 show dialog
              } else if (value == 2) {
                handleStartStop();
              }
            },
          ),
        ],
      ),

      body: SudokuWidget(),
    );
  }
}
