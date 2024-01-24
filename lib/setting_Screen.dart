import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/home_Screen.dart';
import 'package:flutter_killer_sudoku/in_Setting_Screens.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Options",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
              ),
            ),
            SizedBox(width: 100,),


            InkWell(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context)=>  const MyHomePage(title: "Killer Sudoku")
                    )
                );
              },
              child: Text(
                "Done",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),

      body: ListView(
        children:  [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const InSettingPage()
                          )
                      );
                    },
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Card(
                            color: Colors.red,
                            child: Icon(
                                Icons.settings
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(2))
                            ),
                          ),
                        ),

                        Text(
                          "Settings",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        SizedBox(width: 200,),

                        Icon(Icons.navigate_next)
                      ],
                    ),
                  ),

                  Divider(
                    height: 5,
                    indent:40,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          color: Colors.red,
                          child: Icon(
                              Icons.settings
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                        ),
                      ),

                      Text(
                        "How To Play",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 170,),

                      Icon(Icons.navigate_next)
                    ],
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          color: Colors.red,
                          child: Icon(
                              Icons.settings
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                        ),
                      ),

                      Text(
                        "Help",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 220,),

                      Icon(Icons.navigate_next)
                    ],
                  ),

                  Divider(
                    height: 5,
                    indent:40,
                  ),

                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Card(
                          color: Colors.red,
                          child: Icon(
                              Icons.settings
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                        ),
                      ),

                      Text(
                        "About Game",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),
                      ),

                      SizedBox(width: 170,),

                      Icon(Icons.navigate_next)
                    ],
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.red,
                      child: Icon(
                          Icons.settings
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                    ),
                  ),

                  Text(
                    "Math Puzzle",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(width: 170,),

                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      color: Colors.red,
                      child: Icon(
                          Icons.settings
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                    ),
                  ),

                  Text(
                    "Remove Ads",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  SizedBox(width: 170,),

                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
