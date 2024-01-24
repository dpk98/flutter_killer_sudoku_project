import 'package:flutter/material.dart';
import 'package:flutter_killer_sudoku/sudoku_example.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {


  var completed = 0;
  var month_days = [31,28,31,30,31,30,31,31,30,31,30,31];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Daily Challange",
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Keep Your Mind Sharp",style: TextStyle(fontSize: 25),),
          Text(
            "Complete he challenge",
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star,color: Colors.orange,),
              Text("[$completed/")
            ],
          ),
          Container(
            height: 300,

            color: Colors.black12,
            child: TableCalendar(

              //dayHitTestBehavior: HitTestBehavior.translucent,
              daysOfWeekHeight: 20,
              rowHeight: 35,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: Size(220, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                )
            ),
            onPressed: (){
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => HomePage()
                  )
              );
            },
            child: Text("PLAY",style: TextStyle(color: Colors.white,fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
