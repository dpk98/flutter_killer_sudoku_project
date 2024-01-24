import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/Game_Play/blokChar.dart';
import 'package:flutter_killer_sudoku/Game_Play/boxInner.dart';
import 'package:flutter_killer_sudoku/Game_Play/focusClass.dart';

import 'package:quiver/iterables.dart';
import 'package:sudoku_solver_generator/sudoku_solver_generator.dart';

class SudokuWidget extends StatefulWidget {
  const SudokuWidget({super.key});

  @override
  State<SudokuWidget> createState() => _SudokuWidgetState();
}

class _SudokuWidgetState extends State<SudokuWidget> {

  // our Variable

  List<BoxInner> boxInners = [];
  FocusClass focusClass = FocusClass();
  bool isFinish = false;
  String? tapBoxIndex;

  @override
  void initState() {
    generateSudoku();

    // TODO: important initstate
    super.initState();
  }

  void generateSudoku() {
    isFinish = false;
    focusClass = new FocusClass();
    tapBoxIndex = null;
    generatePuzzle();
    checkFinish();

    setState(() {});
  }


  Path customPath = Path()
    ..moveTo(20, 20)
    ..lineTo(50, 80)
  ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () => generatePuzzle(),
              child: const Icon(Icons.refresh))
        ],
      ),
      //backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin : const EdgeInsets.all(10),
                //height: 400,
                padding: const EdgeInsets.all(5),
                width: double.maxFinite,
                color: Colors.blueGrey,
                alignment: Alignment.center,
                child: GridView.builder(
                  itemCount: boxInners.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                  ),
                  physics: const ScrollPhysics(),
                  itemBuilder: (buildContext, index){
                    BoxInner boxInner = boxInners[index];

                    return Container(
                      color: Colors.red.shade100,
                      alignment: Alignment.center,
                      child: GridView.builder(
                          itemCount: boxInner.blokChars.length,
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                          ),
                          physics: const ScrollPhysics(),
                          itemBuilder: (buildContext, indexChar){
                            BlokChar blokChar = boxInner.blokChars[indexChar];
                            Color color = Colors.yellow.shade100;
                            Color colorText = Colors.black;

                            if(isFinish) {
                              color = Colors.green;
                            }

                            else if (blokChar.isDefault)
                              color =  Colors.grey.shade200;

                            else if (blokChar.isFocus)
                              color = Colors.green.shade100;

                            if(tapBoxIndex == "${index} - ${indexChar}")
                              color = Colors.blue.shade100;

                            if(this.isFinish)
                              colorText = Colors.white;

                            else if(  blokChar.isExist)
                              colorText = Colors.red;

                            return Stack(
                              children: [

                              Container(
                              color: color,

                              alignment: Alignment.center,
                              child: TextButton(
                                  onPressed: blokChar.isDefault ? null : () =>setFocus(index, indexChar),
                                  child: Text("${blokChar.text}",style: TextStyle(color: colorText),)
                              ),
                              ),
                                /*blokChar.isDefault ?
                                Container(
                                  child: Text("27",style: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),),
                                ):
                                    SizedBox()*/
                              ],
                            );
                            
                          }
                      ),
                    );
                  }
                ),
              ),

              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () => setInput(null),
                    child: Column(
                      children: [
                        Icon(Icons.undo),
                        Text("CLEAR"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Icon(Icons.undo),
                      Text("UNDO"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.undo,),
                      Text("OFF",),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.undo),
                      Text("HINT"),
                    ],
                  ),

                ],
              ),

              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(9, (index) =>
                    InkWell(
                      onTap: () => setInput(index+1),
                      child: Text(
                        (index+1).toString(),
                        style: const TextStyle(letterSpacing: 20,fontSize: 30,color: Colors.blue),
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  generatePuzzle(){

    boxInners.clear();
    var sudokuGenerator = SudokuGenerator(emptySquares: 2);

    List<List<List<int>>> completes = partition(
        sudokuGenerator.newSudokuSolved,
        sqrt(
            sudokuGenerator.newSudoku.length
        ).toInt()
        ).toList();
    partition(
        sudokuGenerator.newSudoku,
        sqrt(
            sudokuGenerator.newSudoku.length).toInt()
        )
        .toList()
        .asMap()
        .entries
        .forEach(
            (entry) {
          List<int> tempListCompletes =
          completes[entry.key].expand((element) => element).toList();
          List<int> tempList = entry.value.expand((element) => element).toList();

          tempList.asMap().entries.forEach((entryIn) {
            int index =
                entry.key * sqrt(sudokuGenerator.newSudoku.length).toInt() +
                    (entryIn.key % 9).toInt() ~/ 3;

            if (boxInners.where((element) => element.index == index).length ==  0) {
              boxInners.add(BoxInner(index, []));
            }

            BoxInner boxInner =
                boxInners.where((element) => element.index == index).first;

            boxInner.blokChars.add(BlokChar(
              entryIn.value == 0 ? "" : entryIn.value.toString(),
              index: boxInner.blokChars.length,
              isDefault: entryIn.value != 0,
              isCorrect: entryIn.value != 0,
              correctText: tempListCompletes[entryIn.key].toString(),
            ));
          }
          );
        }
    );

    setState(() {});
  }



  setFocus(int index, int indexChar) {
    tapBoxIndex = "$index - $indexChar";
    focusClass.setData(index, indexChar);
    showFocusCenterLine();
    setState(() {});
  }

  void showFocusCenterLine() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    boxInners.forEach((element) => element.clearFocus());

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
            (e) => e.setFocus(focusClass.indexChar!, Direction.Horizontal));

    boxInners.where((element) => element.index % 3 == colNoBox).forEach(
            (e) => e.setFocus(focusClass.indexChar!, Direction.Vertical));
  }

  setInput(int? number) {
    if (focusClass.indexBox == null) return;

    if (boxInners[focusClass.indexBox!]
            .blokChars[focusClass.indexChar!].text ==
            number.toString() ||
    number == null) {
      boxInners.forEach((element) {
        element.clearFocus();
        element.clearExist();
      });
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setEmpty();

      tapBoxIndex = null;
      isFinish = false;
      showSameInputOnSameLine();
    }   else {
      boxInners[focusClass.indexBox!]
          .blokChars[focusClass.indexChar!]
          .setText("$number}");

      showSameInputOnSameLine();

      checkFinish();
    }

    setState(() {
      
    });
  }

  void showSameInputOnSameLine() {
    int rowNoBox = focusClass.indexBox! ~/ 3;
    int colNoBox = focusClass.indexBox! % 3;

    String textInput = boxInners[focusClass.indexBox!]
        .blokChars[focusClass.indexChar!].text!;




    boxInners.forEach((element) => element.clearExist());

    boxInners.where((element) => element.index ~/ 3 == rowNoBox).forEach(
            (e) => e.setExistValue(
                focusClass.indexChar!,
                focusClass.indexBox!,
                textInput,
                Direction.Horizontal));

    boxInners.where((element) => element.index % 3 == colNoBox).forEach(
            (e) => e.setExistValue(focusClass.indexChar!,
                focusClass.indexBox!,
                textInput ,
                Direction.Vertical));

    List<BlokChar> exists = boxInners
        .map((element) => element.blokChars)
        .expand((element) => element)
        .where((element) => element.isExist)
        .toList();

    if (exists.length == 1) exists[0].isExist = false;
  }

  void checkFinish() {
    int totalUnfinish = boxInners
        .map((e) => e.blokChars)
        .expand((element) => element)
        .where((element) => !element.isCorrect)
        .length;

    isFinish = totalUnfinish == 0;
  }
}


