import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/Game_Play/game_Screen.dart';
import 'package:flutter_killer_sudoku/Peck_Screen.dart';
import 'package:flutter_killer_sudoku/calendar_Screen.dart';
import 'package:flutter_killer_sudoku/drawer_Screen.dart';
import 'package:flutter_killer_sudoku/sudoku_example.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var titles = ['', 'MEDIUM', 'HARD'];

  List<List<int>> a= [
    [0, 0, 7, 5, 2, 0, 0, 6, 0],
    [0, 0, 2, 0, 0, 9, 0, 0, 8],
    [0, 0, 7, 5, 2, 0, 0, 6, 0],
    [0, 0, 2, 0, 0, 9, 0, 0, 8],
    [0, 0, 7, 5, 2, 0, 0, 6, 0],
    [0, 0, 2, 0, 0, 9, 0, 0, 8],
    [0, 0, 7, 5, 2, 0, 0, 6, 0],
    [0, 0, 2, 0, 0, 9, 0, 0, 8],
    [0, 0, 7, 5, 2, 0, 0, 6, 0],
  ];
  late Stopwatch stopwatch;
  late Timer t;

  void handleStartStop() {
    if(stopwatch.isRunning) {
      stopwatch.stop();
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
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            const SizedBox(width: 35,),
            Icon(Icons.lens,size: 20,color: Colors.teal[800],),
            Icon(Icons.lens,size: 20,color: Colors.teal[800],),
            InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CalendarPage()
                    )
                );
              },
              child: Icon(Icons.calendar_today,size: 20,color: Colors.teal[800],),
            ),

          ],
        ),
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
              const PopupMenuItem(
                value: 3,
                child: SizedBox(
                  width: 150,
                  child: Text("Privacy Policy"),
                ),
              ),
            ],
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                Share.share("https://play.google.com/store/apps/details?id=com.agandeev.mathgames.free");
                // if value 2 show dialog
              }
            },
          ),
        ],
      ),
      body: /*ListView.builder(itemBuilder: (context, index){
        if(index == 0){
          Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            height: 200,
            width: 200,
            child: Text("data"),
          );
        }
        else{
          FilledButton(
            onPressed: (){},
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.teal,),
            ),
            child: Text("MEDIUM",style: TextStyle(color: Colors.white),),
          );
        }
      },
      itemCount: 7,
      ),*/
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              margin : const EdgeInsets.all(20),
              //height: 400,
              padding: const EdgeInsets.all(5),
              width: 230,
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: GridView.builder(
                  itemCount: 9,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  physics: const ScrollPhysics(),
                  itemBuilder: (buildContext, RowNo){
                    return Container(
                      color: Colors.red.shade100,
                      alignment: Alignment.center,
                      child: GridView.builder(
                          itemCount: 9,
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          physics: const ScrollPhysics(),
                          itemBuilder: (buildContext, ColNo){
                            Color color = Colors.yellow.shade100;
                            Color colorText = Colors.black;
                            if(a[RowNo][ColNo] == 0){
                              return Container(
                                color: color,
                                alignment: Alignment.center,
                                child: Text(
                                  "",
                                  style: TextStyle(color: colorText),
                                ),
                              );
                            }
                            else{
                              return Container(
                                color: color,
                                alignment: Alignment.center,
                                child: Text(
                                  "${a[RowNo][ColNo]}",
                                  style: TextStyle(color: colorText),
                                ),
                              );
                            }
                          }
                      ),
                    );
                  }
              ),
            ),


            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PeckPage(title: "EASY"),
                    )
                );
              },

              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const Text(
                "EASY",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.0
                ),
              ),
            ),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  PeckPage(title: "${titles[1]}"),
                    )
                );
              },
              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const Text("MEDIUM",style: TextStyle(color: Colors.white,letterSpacing: 1.0),),
            ),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  PeckPage(title: "${titles[2]}"),
                    )
                );
              },
              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const Text("HARD",style: TextStyle(color: Colors.white,letterSpacing: 2.0),),
            ),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const CalendarPage()
                    )
                );
              },
              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_today_rounded,),
                    Text("DAILY CHALLENGE",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            FilledButton(
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )
                );
              },
              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const SizedBox(
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.all_inclusive,),

                    Text("RANDOM SUDOKU",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            FilledButton(
              onPressed: (){

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => GamePage())
                );
              },
              style: FilledButton.styleFrom(
                  minimumSize: const Size(220, 40),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  )
              ),
              child: const Text("RESUME",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
      drawer: const Drawer(
        child: DrawerPage(),
      ),
    );
  }
}
