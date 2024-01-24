import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/sudoku_list_Screen.dart';

class PeckPage extends StatefulWidget {
  const PeckPage({super.key, required this.title});
  final String title;
  @override
  State<PeckPage> createState() => _PeckPageState();
}

class _PeckPageState extends State<PeckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: ListView(
        children:  List.generate(
            100, (index) {
          if(index==0){
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SudokuListPage(title: "HARD"),
                    )
                );
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Peck "+(index+1).toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: const Padding(
                      padding:  EdgeInsets.only(right: 50.0),
                      child: Text("Solved (0/30)",style: TextStyle(fontSize: 15),),
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                    thickness: 1,

                  ),
                ],
              ),
            );
          }
          else {
            return InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SudokuListPage(title: "HARD"),
                    )
                );
              },
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Peck " + (index + 1).toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    trailing: Text("NEW",style: TextStyle(fontSize: 15),),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.grey[400],
                    thickness: 1,

                  ),
                ],
              ),
            );
          }
        }
        ),
      ),
    );
  }
}
