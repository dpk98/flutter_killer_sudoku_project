import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/sudoku_example.dart';


class SudokuListPage extends StatefulWidget {
  const SudokuListPage({super.key, required this.title});
  final String title;
  @override
  State<SudokuListPage> createState() => _SudokuListPageState();
}

class _SudokuListPageState extends State<SudokuListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children:  List.generate(
            30, (index) {
          return
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )
                );
              },
              child: ListTile(
                title: Text(
                  "SUDOKU " + (index + 1).toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                trailing: Text("NEW",style: TextStyle(fontSize: 15),),
              ),
            );
          /*Divider(
                height: 1,
                color: Colors.grey[400],
                thickness: 1,
              )*/
        }
        ),
      ),
    );
  }
}
