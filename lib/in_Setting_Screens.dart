import 'package:flutter/material.dart';

class InSettingPage extends StatefulWidget {
  const InSettingPage({super.key});

  @override
  State<InSettingPage> createState() => _InSettingPageState();
}

class _InSettingPageState extends State<InSettingPage> {
  List<bool> name = [false, false, false, false, false, false ,false, false, false, false];

  var titles = ['Input Selection Mode', 'Show Time' , 'Highlight duplicates', 'Highlight Directions' ,
    'Highlight Similar Cell' , 'Auto remove notes', 'Automatic error detection' , ' Privacy Policy'];
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.blue;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),

        body: ListView(
          children: List.generate(
              8, (index) {
            if(index == 0){
              return ListTile(
                leading: SizedBox(
                  width: 35,
                ),
                title: Text(titles[index]),
                subtitle: Text(
                  "Selelct cell Numbers then Enter number",
                  style: TextStyle(color: Colors.grey,),
                ),

              );
            }
            if(index == 7){
              return ListTile(
                leading: SizedBox(
                  width: 35,
                ),
                title: Text(titles[index]),


              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                  leading: const SizedBox(
                    width: 35,
                  ),
                  title: Text(titles[index]),
                  subtitle: const Text(
                    "Select cell Numbers then Enter number",
                    style: TextStyle(color: Colors.grey,),
                  ),
                  trailing: Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: name[index],
                    onChanged: (bool? value) {
                      setState(() {
                        name[index] = value!;
                      });
                    },
                  )
              ),
            );
          }
          ),
        )
    );
  }
}
