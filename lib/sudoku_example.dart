import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/setting_Screen.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<List<int>> sudokuBoard;
  late List<List<bool>> initialCells;


  Path customPath = Path()
    ..moveTo(20, 20)
    ..lineTo(50, 80)
    ;
  @override
  void initState() {
    super.initState();
    // Generate a new Sudoku puzzle
    sudokuBoard = generateSudoku();
    // Mark some cells as initially filled
    initialCells = markInitialCells(sudokuBoard);
  }

  List<List<int>> generateSudoku() {
    // Implement your Sudoku generation algorithm here
    // For simplicity, we provide a pre-generated puzzle
    return [
      [5, 3, 0, 0, 7, 0, 0, 0, 0],
      [6, 0, 0, 1, 9, 5, 0, 0, 0],
      [0, 9, 8, 0, 0, 0, 0, 6, 0],
      [8, 0, 0, 0, 6, 0, 0, 0, 3],
      [4, 0, 0, 8, 0, 3, 0, 0, 1],
      [7, 0, 0, 0, 2, 0, 0, 0, 6],
      [0, 6, 0, 0, 0, 0, 2, 8, 0],
      [0, 0, 0, 4, 1, 9, 0, 0, 5],
      [0, 0, 0, 0, 8, 0, 0, 7, 9],
    ];
  }

  List<List<bool>> markInitialCells(List<List<int>> sudokuBoard) {
    return List.generate(9, (i) => List.generate(9, (j) => sudokuBoard[i][j] != 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade200,
        title: Text('Sudoku Game'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                value:  1,
                child: SizedBox(
                  width: 150,
                  child:
                  Text("Share"),
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: SizedBox(
                  width: 150,
                  child: Text("Rate us!"),
                ),
              ),
            ],
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SettingPage())
                );
              }
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.red.shade200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 9; i++)
                    Row(
                      children: [
                        for (int j = 0; j < 9; j++)
                          SudokuCell(
                            value: sudokuBoard[i][j],
                            isInitial: initialCells[i][j],
                            onTap: () {
                              // Implement cell tap logic here
                              if (!initialCells[i][j]) {
                                // Allow the user to input a value for this cell
                                // Update the cell value in the sudokuBoard
                                setState(() {
                                  // Implement your logic for handling user input
                                  // For simplicity, we just increment the value
                                  sudokuBoard[i][j] = (sudokuBoard[i][j] % 9) + 1;
                                });
                              }
                            },
                          ),
                      ],
                    ),
                ],
              ),
            ),

            SizedBox(height: 30,),

            DottedBorder(
              customPath: (size)=> customPath,
              child: Container(

                width: 150,
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SudokuCell extends StatelessWidget {
  final int value;
  final bool isInitial;
  final VoidCallback? onTap;

  SudokuCell({required this.value, required this.isInitial, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          color: isInitial ? Colors.grey : Colors.white,
        ),
        child: Center(
          child: Text(
            value != 0 ? value.toString() : '',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}


