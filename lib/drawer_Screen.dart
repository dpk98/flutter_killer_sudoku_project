import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/calendar_Screen.dart';
import 'package:flutter_killer_sudoku/sudoku_example.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {

  var levels = ['Random easy', 'Random medium', 'Random hard'];


  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(

            child: ListView.builder(itemBuilder: (context, index){
              if(index == 0){
                return const Text("Sudoku");
              }
              else{
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,top: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.apps),
                        const SizedBox(width: 15,),
                        Text(levels[index-1]),
                      ],
                    ),
                  ),
                );
                /*ListTile(
                  leading: Icon(Icons.apps),
                  title:
                );*/
              }
            },
              itemCount: 4,
            )

          /*Column(
              children: [
              Text("Sudoku"),
              ListTile(
                leading: Icon(Icons.apps),
                title: Text("levels[index-1]")
              ),
            ],
            ) */
          //Text("Extra sudoku"),

        ),

        SizedBox(
          height: 150,
          child: DrawerHeader(
              child: ListView(
                children: [
                  const Text("Challenges"),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const CalendarPage()
                          )
                      );
                    },
                    child: const ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(
                        "Daily Challenges",

                      ),
                    ),
                  )
                ],
              )
          ),
        ),
        SizedBox(
          height: 400,
          child: DrawerHeader(
              child: ListView(
                children: [
                  const Text("General"),
                  InkWell(
                    onTap: () {
                      //Share.share("https://play.google.com/store/apps/details?id=com.agandeev.mathgames.free");
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.color_lens_rounded),
                          SizedBox(width: 15,),
                          Text("Themes"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      //Share.share("https://play.google.com/store/apps/details?id=com.agandeev.mathgames.free");
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 10),
                      child: Row(
                        children: [

                          Icon(Icons.star),
                          SizedBox(width: 15,),
                          Text("Rate the game"),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {

                      const link = "https://www.youtube.com/";

                      launchUrl(
                        Uri.parse(link),
                        mode: LaunchMode.inAppWebView
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 15,),
                          Text("Follow me"),
                        ],
                      ),
                    ),
              ),
                  InkWell(
                    onTap: () async {
                      await Share.share("https://play.google.com/store/apps/details?id=com.agandeev.mathgames.free");
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 20.0,top: 10),
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 15,),
                          Text("Share"),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ],
    );
  }
}
